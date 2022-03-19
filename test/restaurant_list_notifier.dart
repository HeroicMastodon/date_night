import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_restaurant_repository.dart';

import 'mocks/mock_restaurant_repository.dart';

import 'mocks/mock_restaurant_repository.dart';

void main() {
  test('only uniquely name restaurants will be included during construction',
      () {
    var restaurantModel = Restaurant("name", 0, 0);
    final notifier = RestaurantListNotifier([
      restaurantModel,
      Restaurant("name", 1, 1),
      Restaurant("name", 2, 2),
    ], MockRestaurantRepository());

    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
  });

  test('uniquely named restaurants will be added to the notifier', () {
    final notifier = RestaurantListNotifier([], MockRestaurantRepository());
    final restaurantModel = Restaurant("one", 0, 0);

    notifier.add(restaurantModel);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
    notifier.add(restaurantModel);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);

    final modelWithDuplicateName = Restaurant("one", 1, 1);
    notifier.add(modelWithDuplicateName);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
    expect(notifier[0] != modelWithDuplicateName, true);

    final modelWithDifferentName = Restaurant("name", 2, 2);
    notifier.add(modelWithDifferentName);
    expect(notifier.count, 2);
    expect(notifier[0], restaurantModel);
    expect(notifier[1], modelWithDifferentName);

    notifier.dispose();
  });

  test('only the item matching a given restaurants name will be removed', () {
    var restaurantModel = Restaurant("one", 1, 1);
    var restaurantModel2 = Restaurant("two", 1, 1);
    final notifier =
        RestaurantListNotifier([restaurantModel, restaurantModel2], MockRestaurantRepository());

    notifier.remove(restaurantModel2);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);

    notifier.remove(restaurantModel2);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);

    notifier.remove(restaurantModel);
    expect(notifier.count, 0);

    notifier.remove(restaurantModel);
    expect(notifier.count, 0);

    notifier.dispose();
  });

  test('only an existing item will be updated when given new properties', () {
    var restaurantModel = Restaurant("one", 1, 1);
    var restaurantModel2 = Restaurant("two", 1, 1);
    final notifier =
        RestaurantListNotifier([restaurantModel, restaurantModel2], MockRestaurantRepository());

    var modelWithNewName = restaurantModel.copyWith(name: "hi");
    notifier.replace(restaurantModel, modelWithNewName);
    expect(notifier[0], modelWithNewName);

    notifier.replace(modelWithNewName, modelWithNewName);
    expect(notifier[0], modelWithNewName);

    var modelWithNewPreference = modelWithNewName.copyWith(myPreference: 3);
    notifier.replace(modelWithNewName, modelWithNewPreference);
    expect(notifier[0], modelWithNewPreference);

    notifier.replace(modelWithNewPreference, restaurantModel2);
    expect(notifier[0], modelWithNewPreference);
  });

  test('modifying the notifier will notify listeners', () {
    final notifier = RestaurantListNotifier([], MockRestaurantRepository());

    var callCount = 0;
    var expectedCallCount = 0;
    notifier.addListener(() {
      ++callCount;
    });

    notifier.add(Restaurant("name", 0, 0));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.add(Restaurant("name", 0, 0));
    expect(callCount, expectedCallCount);

    notifier.remove(Restaurant("name", 0, 0));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.remove(Restaurant("name", 0, 0));
    expect(callCount, expectedCallCount);

    notifier.update(notifier.value);
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.add(Restaurant("name", 0, 0));
    expectedCallCount++;
    notifier.replace(Restaurant("name", 0, 0), Restaurant("hello", 0, 0));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("name", 0, 0), Restaurant("hello", 0, 0));
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("hello", 0, 0), Restaurant("hello", 0, 0));
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("hello", 0, 0), Restaurant("hello", 1, 0));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.dispose();
  });

  test(
    'my preferred restaurants will only include items from the list with my preference > 0.',
    () {
      final notifier = RestaurantListNotifier([], MockRestaurantRepository());
      final restaurants = [
        Restaurant("panda", 1, 1),
        Restaurant("mc donald's", 1, 0),
        Restaurant("burger king", 0, 1),
      ];
      for (var restaurant in restaurants) {
        notifier.add(restaurant);
      }

      final myPreferred = notifier.myPreferredRestaurants;
      expect(myPreferred.every((element) => element.myPreference > 0), true);

      for (var restaurant in myPreferred) {
        expect(restaurants.contains(restaurant), true);
      }
    },
  );
  test(
    'her preferred restaurants will only include items from the list with herPreference > 0.',
    () {
      final notifier = RestaurantListNotifier([], MockRestaurantRepository());
      final restaurants = [
        Restaurant("panda", 1, 1),
        Restaurant("mc donald's", 1, 0),
        Restaurant("burger king", 0, 1),
      ];
      for (var restaurant in restaurants) {
        notifier.add(restaurant);
      }

      final herPreferred = notifier.herPreferredRestaurants;
      expect(herPreferred.every((element) => element.herPreference > 0), true);

      for (var restaurant in herPreferred) {
        expect(restaurants.contains(restaurant), true);
      }
    },
  );
}
