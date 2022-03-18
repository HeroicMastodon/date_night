import 'package:date_night/model/restaurant.dart';
import 'package:flutter/cupertino.dart';

class RestaurantListNotifier extends ValueNotifier<List<Restaurant>> {
  RestaurantListNotifier(List<Restaurant> value) : super(value) {
    final map = <String, bool>{};
    final list = <Restaurant>[];
    for (var element in value) {
      if (!map.containsKey(element.name)) {
        map.putIfAbsent(element.name, () => true);
        list.add(element);
        continue;
      }
    }

    this.value = list;
  }

  static RestaurantListNotifier initialize() {
    return RestaurantListNotifier([]);
  }

  void add(Restaurant model) {
    for (var element in value) {
      if (element.name.toLowerCase() == model.name.toLowerCase()) {
        return;
      }
    }

    value = [...value, model];
  }

  void remove(Restaurant model) {
    final newValue = [
      for (var element in value)
        if (element.name != model.name) element
    ];

    if (newValue.length == value.length) {
      return;
    }

    value = newValue;
  }

  void replace(Restaurant oldModel, Restaurant newModel) {
    if (oldModel == newModel) return;

    final index = value.indexOf(oldModel);

    if (index == -1) return;

    if (oldModel.name != newModel.name) {
      for (var model in value) {
        if (model.name == newModel.name) {
          return;
        }
      }
    }

    value[index] = newModel;
    value = [...value];
  }

  void update(List<Restaurant> model) {
    value = [...model];
  }

  Restaurant operator [](int index) {
    return value.elementAt(index);
  }

  num get count => value.length;

  List<Restaurant> get myPreferredRestaurants {
    return value
        .where((element) => element.myPreference > 0)
        .toList(growable: false);
  }

  List<Restaurant> get herPreferredRestaurants {
    return value
        .where((element) => element.herPreference > 0)
        .toList(growable: false);
  }
}
