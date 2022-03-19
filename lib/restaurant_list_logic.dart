import 'dart:math';

import 'package:date_night/collections/stacked_set.dart';
import 'package:date_night/commands/restaurant_command.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:date_night/model/restaurant.dart';
import 'helpers/get_it_helper.dart';

class RestaurantListLogic {
  RestaurantListLogic(this.restaurantList);
  final RestaurantListNotifier restaurantList;
  final undoStack = StackedSet<RestaurantCommand>();
  final redoStack = StackedSet<RestaurantCommand>();

  void takeAction(RestaurantCommand command) {
    _takeAction(command);
    undoStack.add(command);
    redoStack.clear();
  }

  void undo() {
    final command = undoStack.top();
    _takeAction(command);
    undoStack.pop();
  }

  void redo() {
    final command = redoStack.top();
    _takeAction(command);
    redoStack.pop();
  }

  void _takeAction(RestaurantCommand command) {
    command.when(
      add: (restaurant) {
        restaurantList.add(restaurant);
      },
      remove: (restaurant) {
        restaurantList.remove(restaurant);
      },
      replace: (old, updated) {
        restaurantList.replace(old, updated);
      },
    );
  }

  Restaurant? get myRandomPick {
    final myPreferred = restaurantList.myPreferredRestaurants;

    if(myPreferred.isEmpty) return null;

    final weighted = <Restaurant>[];

    for (var restaurant in myPreferred) {
      for(var i = 0; i < restaurant.myPreference; i++) {
        weighted.add(restaurant);
      }
    }

    final pick = _randomPick(weighted);

    print(weighted.length);
    return pick;
  }

  Restaurant? get herRandomPick {
    final herPreferred = restaurantList.herPreferredRestaurants;

    if (herPreferred.isEmpty) return null;

    final weighted = <Restaurant>[];

    for (var restaurant in herPreferred) {
      for(var i = 0; i < restaurant.herPreference; i++) {
        weighted.add(restaurant);
      }
    }

    print(weighted.length);

    final pick = _randomPick(weighted);

    return pick;
  }

  Restaurant _randomPick(List<Restaurant> restaurants) {
    var rng = Random(DateTime.now().millisecondsSinceEpoch);
    var randomIndex = rng.nextInt(restaurants.length);
    var pick = restaurants.elementAt(randomIndex);

    return pick;
  }
}
