import 'package:freezed_annotation/freezed_annotation.dart';

part 'preference.freezed.dart';
part 'preference.g.dart';

@freezed
class Preference with _$Preference {
  factory Preference.none([@Default("None") String label, @Default(0) int weight]) = _None;
  factory Preference.like([@Default("Like It") String label, @Default(1) int weight]) = _Like;
  factory Preference.love([@Default("Love It") String label, @Default(2) int weight]) = _Love;
  factory Preference.favorite([@Default("Favorite") String label, @Default(3) int weight]) = _Favorite;

  factory Preference.fromJson(Map<String, dynamic> json) => _$PreferenceFromJson(json);
}
