import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_repository.dart';
import 'package:flutter/cupertino.dart';

class RestaurantListNotifier extends ValueNotifier<List<Restaurant>> {
  final RestaurantRepository _repository;

  RestaurantListNotifier(List<Restaurant> value, this._repository) : super(value) {
    this.value = _initializeList(value);
  }

  List<Restaurant> _initializeList(List<Restaurant> value) {
    final map = <String, bool>{};
    final list = <Restaurant>[];
    for (var element in value) {
      if (!map.containsKey(element.name)) {
        map.putIfAbsent(element.name, () => true);
        list.add(element);
        continue;
      }
    }
    return list;
  }

  static Future<RestaurantListNotifier> initialize(RestaurantRepository repository) async {
    final value = await repository.getAll();
    return RestaurantListNotifier(value, repository);
  }

  void add(Restaurant model) {
    for (var element in value) {
      if (element.name.toLowerCase() == model.name.toLowerCase()) {
        return;
      }
    }

    value = [...value, model];
    _repository.add(model);
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
    _repository.remove(model);
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
    _repository.replace(oldModel, newModel);
  }

  void update(List<Restaurant> model) {
    value = [...model];
  }

  Restaurant operator [](int index) {
    return value.elementAt(index);
  }

  int get count => value.length;

  List<Restaurant> get myPreferredRestaurants {
    return value
        .where((element) => element.myPreference.weight > 0)
        .toList(growable: false);
  }

  List<Restaurant> get herPreferredRestaurants {
    return value
        .where((element) => element.herPreference.weight > 0)
        .toList(growable: false);
  }
}
