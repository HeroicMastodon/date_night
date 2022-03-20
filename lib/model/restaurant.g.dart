// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      json['name'] as String,
      Preference.fromJson(json['myPreference'] as Map<String, dynamic>),
      Preference.fromJson(json['herPreference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'myPreference': instance.myPreference,
      'herPreference': instance.herPreference,
    };
