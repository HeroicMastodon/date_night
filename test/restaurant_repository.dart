import 'dart:convert';

import 'package:date_night/model/preference.dart';
import 'package:date_night/model/preference.dart';
import 'package:date_night/model/preference.dart';
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
    final restaurant = Restaurant("hi", Preference.none(), Preference.like());

    await repo.add(restaurant);
    expect(prefs.containsKey(restaurant.name), true);
    var actual = prefs.getString(restaurant.name);
    expect(actual, json.encode(restaurant));
  });
  test('a restaurant will be removed from shared prefs', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurant = Restaurant("hi", Preference.none(), Preference.like());

    repo.add(restaurant);
    repo.remove(restaurant);

    expect(prefs.containsKey(restaurant.name), false);
  });
  test('a restaurant will be replaced in shared prefs', () async {
    final prefs = await SharedPreferences.getInstance();
    final repo = RestaurantSharedPrefRepository(prefs);
    final restaurant = Restaurant("hi", Preference.none(), Preference.like());
    final newName = restaurant.copyWith(name: "hello");
    final newPreference = newName.copyWith(myPreference: Preference.favorite());

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
      Restaurant("hi", Preference.like(), Preference.love()),
      Restaurant("hello", Preference.like(), Preference.love()),
      Restaurant("name", Preference.like(), Preference.love()),
      Restaurant("panda", Preference.like(), Preference.love()),
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