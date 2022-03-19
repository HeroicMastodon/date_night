import 'package:date_night/model/restaurant.dart';
import 'package:date_night/restaurant_repository.dart';

class MockRestaurantRepository implements RestaurantRepository {
  @override
  Future<void> add(Restaurant restaurant) async {
  }

  @override
  Future<List<Restaurant>> getAll() async {
    return [];
  }

  @override
  Future<Restaurant> getByName(String name) async {
    return Restaurant(name, 0, 0);
  }

  @override
  Future<void> remove(Restaurant restaurant) async {
  }

  @override
  Future<void> replace(Restaurant old, Restaurant update) async {
  }

}