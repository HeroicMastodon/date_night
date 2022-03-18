import 'dart:convert';

import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  setUp(() async  {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  });
  tearDown(() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  });
  test('a restaurant will be added to shared preferences', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurant = Restaurant("hi", 0, 1);

    await repo.add(restaurant);
    expect(prefs.containsKey(restaurant.name), true);
    var actual = prefs.getString(restaurant.name);
    expect(actual, json.encode(restaurant));
  });
  test('a restaurant will be removed from shared prefs', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurant = Restaurant("hi", 0, 1);

    repo.add(restaurant);
    repo.remove(restaurant);

    expect(prefs.containsKey(restaurant.name), false);
  });
  test('a restaurant will be replaced in shared prefs', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurant = Restaurant("hi", 0, 1);
    final newName = restaurant.copyWith(name: "hello");
    final newPreference = newName.copyWith(myPreference: 100);

    repo.add(restaurant);
    repo.replace(restaurant, newName);
    expect(prefs.containsKey(newName.name), true);
    expect(prefs.containsKey(restaurant.name), false);
    var newNameActual = prefs.getString(newName.name);
    expect(newNameActual, json.encode(newName));

    repo.replace(newName, newPreference);
    expect(prefs.containsKey(newPreference.name), true);
    var newPrefActual = prefs.getString(newPreference.name);
    expect(newPrefActual, json.encode(newPreference));
  });
  test('getting all restaurants will return all restaurants', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurants = <Restaurant>[
      Restaurant("hi", 1, 2),
      Restaurant("hello", 1, 2),
      Restaurant("name", 1, 2),
      Restaurant("panda", 1, 2),
    ];

    for (var restaurant in restaurants) {
      repo.add(restaurant);
    }

    final actual = await repo.getAll();

    expect(actual.length, restaurants.length);
    for (var restaurant in restaurants) {
      expect(actual.contains(restaurant), true, reason: 'expected: $restaurants, actual $actual');
    }
  });
}