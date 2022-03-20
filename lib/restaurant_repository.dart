import 'dart:developer';

import 'package:date_night/model/restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class RestaurantRepository {
  Future<void> add(Restaurant restaurant);
  Future<void> remove(Restaurant restaurant);
  Future<void> replace(Restaurant old, Restaurant update);
  Future<Restaurant> getByName(String name);
  Future<List<Restaurant>> getAll();
}

class RestaurantSharedPrefRepository implements RestaurantRepository {
  RestaurantSharedPrefRepository(this._dataBase);

  final SharedPreferences _dataBase;

  @override
  Future<void> add(Restaurant restaurant) async {
    if (_dataBase.containsKey(restaurant.name)) {
      return;
    }

    var jsonToSave = jsonEncode(restaurant);
    _dataBase.setString(restaurant.name, jsonToSave);
  }

  @override
  Future<void> remove(Restaurant restaurant) async {
    if (!_dataBase.containsKey(restaurant.name)) {
      return;
    }

    _dataBase.remove(restaurant.name);
  }

  @override
  Future<void> replace(Restaurant old, Restaurant update) async {
    if (!_dataBase.containsKey(old.name)) {
      return;
    }
    if (old == update) {
      return;
    }

    _dataBase.remove(old.name);
    add(update);
  }

  @override
  Future<List<Restaurant>> getAll() async {
    try {
      final keys = _dataBase.getKeys();
      final list = <Restaurant>[];

      for (var key in keys) {
        var jsonString = _dataBase.getString(key);

        if (jsonString == null) {
          continue;
        }

        var jsonMap = json.decode(jsonString);
        var restaurant = Restaurant.fromJson(jsonMap);
        list.add(restaurant);
      }

      return list;
    } catch (e) {
      log(e.toString());
      log("clearing database due to data error");
      _dataBase.clear();
      return [];
    }
  }

  @override
  Future<Restaurant> getByName(String name) async {
    final restaurantJson = _dataBase.getString(name);

    if (restaurantJson == null) {
      throw Error();
    }

    final jsonMap = json.decode(restaurantJson);
    final restaurant = Restaurant.fromJson(jsonMap);

    return restaurant;
  }

}