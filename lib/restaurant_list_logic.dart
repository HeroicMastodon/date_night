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

  void takeAction(RestaurantCommand command) {
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

    undoStack.add(command);
  }

  Restaurant get myRandomPick {
    final myPreferred = restaurantList.myPreferredRestaurants;
    final pick = _randomPick(myPreferred);

    return pick;
  }

  Restaurant get herRandomPick {
    final herPreferred = restaurantList.herPreferredRestaurants;
    final pick = _randomPick(herPreferred);

    return pick;
  }

  Restaurant _randomPick(List<Restaurant> restaurants) {
    var rng = Random(DateTime.now().millisecondsSinceEpoch);
    var randomIndex = rng.nextInt(restaurants.length);
    var pick = restaurants.elementAt(randomIndex);

    return pick;
  }
}
