import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  factory Restaurant(String name, num myPreference, num herPreference) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}
