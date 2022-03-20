import 'package:date_night/model/preference.dart';
import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_list_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mocks/mock_restaurant_repository.dart';

void main() {
  test('only uniquely name restaurants will be included during construction',
      () {
    var restaurantModel = Restaurant("name", Preference.none(), Preference.none());
    final notifier = RestaurantListNotifier([
      restaurantModel,
      Restaurant("name", Preference.like(), Preference.like()),
      Restaurant("name", Preference.love(), Preference.love()),
    ], MockRestaurantRepository());

    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
  });

  test('uniquely named restaurants will be added to the notifier', () {
    final notifier = RestaurantListNotifier([], MockRestaurantRepository());
    final restaurantModel = Restaurant("one", Preference.none(), Preference.none());

    notifier.add(restaurantModel);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
    notifier.add(restaurantModel);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);

    final modelWithDuplicateName = Restaurant("one", Preference.like(), Preference.like());
    notifier.add(modelWithDuplicateName);
    expect(notifier.count, 1);
    expect(notifier[0], restaurantModel);
    expect(notifier[0] != modelWithDuplicateName, true);

    final modelWithDifferentName = Restaurant("name", Preference.love(), Preference.love());
    notifier.add(modelWithDifferentName);
    expect(notifier.count, 2);
    expect(notifier[0], restaurantModel);
    expect(notifier[1], modelWithDifferentName);

    notifier.dispose();
  });

  test('only the item matching a given restaurants name will be removed', () {
    var restaurantModel = Restaurant("one", Preference.like(), Preference.like());
    var restaurantModel2 = Restaurant("two", Preference.like(), Preference.like());
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
    var restaurantModel = Restaurant("one", Preference.like(), Preference.like());
    var restaurantModel2 = Restaurant("two", Preference.like(), Preference.like());
    final notifier =
        RestaurantListNotifier([restaurantModel, restaurantModel2], MockRestaurantRepository());

    var modelWithNewName = restaurantModel.copyWith(name: "hi");
    notifier.replace(restaurantModel, modelWithNewName);
    expect(notifier[0], modelWithNewName);

    notifier.replace(modelWithNewName, modelWithNewName);
    expect(notifier[0], modelWithNewName);

    var modelWithNewPreference = modelWithNewName.copyWith(myPreference: Preference.favorite());
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

    notifier.add(Restaurant("name", Preference.none(), Preference.none()));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.add(Restaurant("name", Preference.none(), Preference.none()));
    expect(callCount, expectedCallCount);

    notifier.remove(Restaurant("name", Preference.none(), Preference.none()));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.remove(Restaurant("name", Preference.none(), Preference.none()));
    expect(callCount, expectedCallCount);

    notifier.update(notifier.value);
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.add(Restaurant("name", Preference.none(), Preference.none()));
    expectedCallCount++;
    notifier.replace(Restaurant("name", Preference.none(), Preference.none()), Restaurant("hello", Preference.none(), Preference.none()));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("name", Preference.none(), Preference.none()), Restaurant("hello", Preference.none(), Preference.none()));
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("hello", Preference.none(), Preference.none()), Restaurant("hello", Preference.none(), Preference.none()));
    expect(callCount, expectedCallCount);

    notifier.replace(Restaurant("hello", Preference.none(), Preference.none()), Restaurant("hello", Preference.like(), Preference.none()));
    expectedCallCount++;
    expect(callCount, expectedCallCount);

    notifier.dispose();
  });

  test(
    'my preferred restaurants will only include items from the list with my preference > 0.',
    () {
      final notifier = RestaurantListNotifier([], MockRestaurantRepository());
      final restaurants = [
        Restaurant("panda", Preference.like(), Preference.like()),
        Restaurant("mc donald's", Preference.like(), Preference.none()),
        Restaurant("burger king", Preference.none(), Preference.like()),
      ];
      for (var restaurant in restaurants) {
        notifier.add(restaurant);
      }

      final myPreferred = notifier.myPreferredRestaurants;
      expect(myPreferred.every((element) => element.myPreference.weight > 0), true);

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
        Restaurant("panda", Preference.like(), Preference.like()),
        Restaurant("mc donald's", Preference.like(), Preference.none()),
        Restaurant("burger king", Preference.none(), Preference.like()),
      ];
      for (var restaurant in restaurants) {
        notifier.add(restaurant);
      }

      final herPreferred = notifier.herPreferredRestaurants;
      expect(herPreferred.every((element) => element.herPreference.weight > 0), true);

      for (var restaurant in herPreferred) {
        expect(restaurants.contains(restaurant), true);
      }
    },
  );
}
