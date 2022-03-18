import '../model/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_command.freezed.dart';

@freezed
class RestaurantCommand with _$RestaurantCommand {
  factory RestaurantCommand.add(Restaurant restaurant) = _Add;
  factory RestaurantCommand.remove(Restaurant restaurant) = _Remove;
  factory RestaurantCommand.replace(Restaurant original, Restaurant updated) = _Replace;
}