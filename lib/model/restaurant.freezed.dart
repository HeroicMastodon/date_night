// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
class _$RestaurantTearOff {
  const _$RestaurantTearOff();

  _Restaurant call(String name, num myPreference, num herPreference) {
    return _Restaurant(
      name,
      myPreference,
      herPreference,
    );
  }

  Restaurant fromJson(Map<String, Object?> json) {
    return Restaurant.fromJson(json);
  }
}

/// @nodoc
const $Restaurant = _$RestaurantTearOff();

/// @nodoc
mixin _$Restaurant {
  String get name => throw _privateConstructorUsedError;
  num get myPreference => throw _privateConstructorUsedError;
  num get herPreference => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res>;
  $Res call({String name, num myPreference, num herPreference});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res> implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  final Restaurant _value;
  // ignore: unused_field
  final $Res Function(Restaurant) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? myPreference = freezed,
    Object? herPreference = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      myPreference: myPreference == freezed
          ? _value.myPreference
          : myPreference // ignore: cast_nullable_to_non_nullable
              as num,
      herPreference: herPreference == freezed
          ? _value.herPreference
          : herPreference // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(
          _Restaurant value, $Res Function(_Restaurant) then) =
      __$RestaurantCopyWithImpl<$Res>;
  @override
  $Res call({String name, num myPreference, num herPreference});
}

/// @nodoc
class __$RestaurantCopyWithImpl<$Res> extends _$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(
      _Restaurant _value, $Res Function(_Restaurant) _then)
      : super(_value, (v) => _then(v as _Restaurant));

  @override
  _Restaurant get _value => super._value as _Restaurant;

  @override
  $Res call({
    Object? name = freezed,
    Object? myPreference = freezed,
    Object? herPreference = freezed,
  }) {
    return _then(_Restaurant(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      myPreference == freezed
          ? _value.myPreference
          : myPreference // ignore: cast_nullable_to_non_nullable
              as num,
      herPreference == freezed
          ? _value.herPreference
          : herPreference // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Restaurant implements _Restaurant {
  _$_Restaurant(this.name, this.myPreference, this.herPreference);

  factory _$_Restaurant.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantFromJson(json);

  @override
  final String name;
  @override
  final num myPreference;
  @override
  final num herPreference;

  @override
  String toString() {
    return 'Restaurant(name: $name, myPreference: $myPreference, herPreference: $herPreference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Restaurant &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.myPreference, myPreference) &&
            const DeepCollectionEquality()
                .equals(other.herPreference, herPreference));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(myPreference),
      const DeepCollectionEquality().hash(herPreference));

  @JsonKey(ignore: true)
  @override
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantToJson(this);
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(String name, num myPreference, num herPreference) =
      _$_Restaurant;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$_Restaurant.fromJson;

  @override
  String get name;
  @override
  num get myPreference;
  @override
  num get herPreference;
  @override
  @JsonKey(ignore: true)
  _$RestaurantCopyWith<_Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}
