import 'package:date_night/commands/restaurant_command.dart';
import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_list_logic.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:test/test.dart';

import 'mocks/mock_restaurant_repository.dart';

void main() {
  test(
    'a new instance will have an empty restaurant list and an empty undo stack',
    () async {
      final instance = await initialize();
      expect(instance.restaurantList.count, 0);
      expect(instance.undoStack.length, 0);
    },
  );
  test(
    'valid commands will update the restaurant list and be added to the undo stack',
    () async {
      final instance = await initialize();
      final restaurant = Restaurant("panda", 1, 0);
      final add = RestaurantCommand.add(restaurant);

      instance.takeAction(add);
      expect(instance.restaurantList[0], restaurant,
          reason: "restaurant was not added");
      expect(instance.undoStack.top(), add,
          reason: "add command was not added");

      final updatedRestaurant = Restaurant("panda", 1, 1);
      final replace = RestaurantCommand.replace(restaurant, updatedRestaurant);
      instance.takeAction(replace);
      expect(instance.restaurantList[0], updatedRestaurant,
          reason: "restaurant was not updated");
      expect(instance.undoStack.top(), replace,
          reason: "replace command was not added");

      final remove = RestaurantCommand.remove(updatedRestaurant);
      instance.takeAction(remove);
      expect(instance.restaurantList.count, 0,
          reason: "restaurant was not removed");
      expect(instance.undoStack.top(), remove,
          reason: "remove command was not added");
    },
  );
  test(
    'getting my random pick will only return a restaurant with my preference from the restaurant list',
    () async {
      final instance = await initialize();
      final restaurants = [
        Restaurant("panda", 1, 1),
        Restaurant("mcdonalds", 1, 0),
        Restaurant("burger king", 0, 1),
      ];

      for (var restaurant in restaurants) {
        instance.takeAction(RestaurantCommand.add(restaurant));
      }

      final myPick = instance.myRandomPick;
      expect(myPick?.myPreference, greaterThan(0));
      expect(restaurants.contains(myPick), true);
    },
  );
  test(
    'getting her random pick will only return a restaurant with her preference from the restaurant list',
    () async {
      final instance = await initialize();
      final restaurants = [
        Restaurant("panda", 1, 1),
        Restaurant("mcdonalds", 1, 0),
        Restaurant("burger king", 0, 1),
      ];

      for (var restaurant in restaurants) {
        instance.takeAction(RestaurantCommand.add(restaurant));
      }

      final herPick = instance.herRandomPick;
      expect(herPick?.herPreference, greaterThan(0));
      expect(restaurants.contains(herPick), true);
    },
  );
}

Future<RestaurantListLogic> initialize() async {
  final notifier = await RestaurantListNotifier.initialize(MockRestaurantRepository());
  return RestaurantListLogic(notifier);
}
