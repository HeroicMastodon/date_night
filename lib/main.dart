import 'dart:developer';
import 'dart:math';

import 'package:date_night/commands/restaurant_command.dart';
import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_list_logic.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:date_night/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it_hooks/get_it_hooks.dart';

void main() async {
  await setup();
  runApp(const App());
}

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var logic = useGet<RestaurantListLogic>();
    var notifier = useListenable(logic.restaurantList);

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            title: const Text('Date Night'),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyPickButton(logic: logic),
                  HerPickButton(logic: logic),
                ],
              ),
            ),
          ),
          body: Center(
            child: ListView.builder(
              itemCount: notifier.count,
              itemBuilder: (context, index) {
                final restaurant = notifier[index];

                return RestaurantWidget(restaurant: restaurant);
              },
            ),
            // child: GridView.builder(
            //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 160,
            //   ),
            //   padding: const EdgeInsets.all(16),
            //   itemCount: notifier.count,
            //   itemBuilder: (context, index) {
            //     final restaurant = notifier[index];
            //     return RestaurantWidget(restaurant: restaurant);
            //   },
            // ),
          ),
          floatingActionButton: NewRestaurantButton(logic: logic),
        ));
  }
}

class HerPickButton extends StatelessWidget {
  const HerPickButton({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final RestaurantListLogic logic;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final pick = logic.herRandomPick;
        showDialog(
            context: context,
            builder: (context) => PickDialog(pick));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Her Pick",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class MyPickButton extends StatelessWidget {
  const MyPickButton({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final RestaurantListLogic logic;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final pick = logic.myRandomPick;
        showDialog(
            context: context,
            builder: (context) => PickDialog(pick));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "My Pick",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

class NewRestaurantButton extends StatelessWidget {
  const NewRestaurantButton({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final RestaurantListLogic logic;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final newRestaurant = await showDialog(
          context: context,
          builder: (context) => RestaurantDialog(
            restaurant: Restaurant("", 0, 0),
          ),
        );
        if (newRestaurant == null) return;
        logic.takeAction(RestaurantCommand.add(newRestaurant));
      },
      tooltip: 'Add Restaurant',
      child: const Icon(Icons.add),
    );
  }
}

class RestaurantWidget extends HookWidget {
  const RestaurantWidget({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final logic = useGet<RestaurantListLogic>();
    const nameStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    const labelStyle = TextStyle(fontSize: 16);
    const preferenceStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

    return InkWell(
      onTap: () async {
        final update = await showDialog(
          context: context,
          builder: (context) {
            return RestaurantDialog(restaurant: restaurant);
          },
        );
        if (update == null) return;

        logic.takeAction(RestaurantCommand.replace(restaurant, update));
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    restaurant.name,
                    style: nameStyle,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      logic.takeAction(RestaurantCommand.remove(restaurant)),
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: [
                      const Text("My Preference: ", style: labelStyle),
                      Text(
                        restaurant.myPreference.toString(),
                        style: preferenceStyle,
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                Row(
                  children: [
                    const Text("Her Preference: ", style: labelStyle),
                    Text(
                      restaurant.herPreference.toString(),
                      style: preferenceStyle,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RestaurantDialog extends HookWidget {
  const RestaurantDialog({Key? key, required this.restaurant})
      : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final state = useState(restaurant);

    return Dialog(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: 320,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Name")),
                        onChanged: (value) {
                          state.value = state.value.copyWith(name: value);
                        },
                        initialValue: state.value.name,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        decoration:
                            const InputDecoration(label: Text("My Preference")),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        initialValue: state.value.myPreference.toString(),
                        onChanged: (value) {
                          if (value.isEmpty) return;
                          var preference = int.parse(value);
                          if (preference < 0 || preference > 10) return;
                          state.value =
                              state.value.copyWith(myPreference: preference);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Her Preference")),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        initialValue: state.value.herPreference.toString(),
                        onChanged: (value) {
                          if (value.isEmpty) return;
                          var preference = int.parse(value);
                          if (preference < 0 || preference > 10) return;

                          state.value =
                              state.value.copyWith(herPreference: preference);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("cancel")),
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context, state.value),
                        child: const Text("Save")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PickDialog extends HookWidget {
  const PickDialog(this.restaurant, {Key? key}) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          "${restaurant.name}!!!",
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
