import 'dart:developer';
import 'dart:math';

import 'package:date_night/commands/restaurant_command.dart';
import 'package:date_night/model/preference.dart';
import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_list_logic.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:date_night/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it_hooks/get_it_hooks.dart';

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

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
    var primarySwatch =
        createMaterialColor(const Color.fromRGBO(41, 216, 111, 1));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: primarySwatch),
      home: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          title: const Text('Date Night'),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: primarySwatch,
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
        body: RestaurantListWidget(notifier: notifier),
        floatingActionButton: NewRestaurantButton(logic: logic),
      ),
    );
  }
}

class RestaurantListWidget extends HookWidget {
  const RestaurantListWidget({
    Key? key,
    required this.notifier,
  }) : super(key: key);

  final RestaurantListNotifier notifier;
  final homeWidgetChannel = const MethodChannel('app.channel.home_widget');

  @override
  Widget build(BuildContext context) {
    var logic = useGet<RestaurantListLogic>();
    var notifier = useListenable(logic.restaurantList);

    useEffect(() {
      print("effect");
      homeWidgetChannel.setMethodCallHandler((call) async {
        print("method call handler");
        print(call.method);
        print(call.arguments);
        switch (call.method) {
          case "getPick":
            if (call.arguments != null) {
              await showDialog(
                context: context,
                builder: (context) {
                  final pick = call.arguments == "hers"
                      ? logic.herRandomPick
                      : logic.myRandomPick;
                  return PickDialog(pick);
                },
              );
            }
        }
      });
      return null;
    });
    return Center(
      child: ListView.builder(
        itemCount: notifier.count,
        itemBuilder: (context, index) {
          final restaurant = notifier[index];

          return RestaurantWidget(restaurant: restaurant);
        },
      ),
    );
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

        showDialog(context: context, builder: (context) => PickDialog(pick));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "Her Pick",
          style: TextStyle(color: Colors.black, fontSize: 24),
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
        showDialog(context: context, builder: (context) => PickDialog(pick));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          "My Pick",
          style: TextStyle(color: Colors.black, fontSize: 24),
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
            restaurant: Restaurant("", Preference.none(), Preference.none()),
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
                        restaurant.myPreference.label,
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
                      restaurant.herPreference.label,
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
                      child: PreferenceDropdown(
                        label: "My Preference",
                        defaultValue: state.value.myPreference,
                        onChanged: (value) {
                          if (value == null) return;

                          state.value =
                              state.value.copyWith(myPreference: value);
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: PreferenceDropdown(
                        label: "Her Preference",
                        defaultValue: state.value.herPreference,
                        onChanged: (value) {
                          if (value == null) return;
                          state.value =
                              state.value.copyWith(herPreference: value);
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

class PreferenceDropdown extends StatelessWidget {
  const PreferenceDropdown({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.defaultValue,
  }) : super(key: key);

  final void Function(Preference? value) onChanged;
  final String label;
  final Preference defaultValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Preference>(
      value: defaultValue,
      decoration: InputDecoration(label: Text(label)),
      items: [
        DropdownMenuItem(
          child: Text(Preference.none().label),
          value: Preference.none(),
        ),
        DropdownMenuItem(
          child: Text(Preference.like().label),
          value: Preference.like(),
        ),
        DropdownMenuItem(
          child: Text(Preference.love().label),
          value: Preference.love(),
        ),
        DropdownMenuItem(
          child: Text(Preference.favorite().label),
          value: Preference.favorite(),
        ),
      ],
      onChanged: onChanged,
    );
  }
}

class PickDialog extends HookWidget {
  const PickDialog(this.restaurant, {Key? key}) : super(key: key);

  final Restaurant? restaurant;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          "${restaurant?.name ?? "They have no preference"}!!!",
          style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
