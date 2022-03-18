// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'restaurant_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RestaurantCommandTearOff {
  const _$RestaurantCommandTearOff();

  _Add add(Restaurant restaurant) {
    return _Add(
      restaurant,
    );
  }

  _Remove remove(Restaurant restaurant) {
    return _Remove(
      restaurant,
    );
  }

  _Replace replace(Restaurant original, Restaurant updated) {
    return _Replace(
      original,
      updated,
    );
  }
}

/// @nodoc
const $RestaurantCommand = _$RestaurantCommandTearOff();

/// @nodoc
mixin _$RestaurantCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Restaurant restaurant) add,
    required TResult Function(Restaurant restaurant) remove,
    required TResult Function(Restaurant original, Restaurant updated) replace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Replace value) replace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCommandCopyWith<$Res> {
  factory $RestaurantCommandCopyWith(
          RestaurantCommand value, $Res Function(RestaurantCommand) then) =
      _$RestaurantCommandCopyWithImpl<$Res>;
}

/// @nodoc
class _$RestaurantCommandCopyWithImpl<$Res>
    implements $RestaurantCommandCopyWith<$Res> {
  _$RestaurantCommandCopyWithImpl(this._value, this._then);

  final RestaurantCommand _value;
  // ignore: unused_field
  final $Res Function(RestaurantCommand) _then;
}

/// @nodoc
abstract class _$AddCopyWith<$Res> {
  factory _$AddCopyWith(_Add value, $Res Function(_Add) then) =
      __$AddCopyWithImpl<$Res>;
  $Res call({Restaurant restaurant});

  $RestaurantCopyWith<$Res> get restaurant;
}

/// @nodoc
class __$AddCopyWithImpl<$Res> extends _$RestaurantCommandCopyWithImpl<$Res>
    implements _$AddCopyWith<$Res> {
  __$AddCopyWithImpl(_Add _value, $Res Function(_Add) _then)
      : super(_value, (v) => _then(v as _Add));

  @override
  _Add get _value => super._value as _Add;

  @override
  $Res call({
    Object? restaurant = freezed,
  }) {
    return _then(_Add(
      restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant,
    ));
  }

  @override
  $RestaurantCopyWith<$Res> get restaurant {
    return $RestaurantCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }
}

/// @nodoc

class _$_Add implements _Add {
  _$_Add(this.restaurant);

  @override
  final Restaurant restaurant;

  @override
  String toString() {
    return 'RestaurantCommand.add(restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Add &&
            const DeepCollectionEquality()
                .equals(other.restaurant, restaurant));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(restaurant));

  @JsonKey(ignore: true)
  @override
  _$AddCopyWith<_Add> get copyWith =>
      __$AddCopyWithImpl<_Add>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Restaurant restaurant) add,
    required TResult Function(Restaurant restaurant) remove,
    required TResult Function(Restaurant original, Restaurant updated) replace,
  }) {
    return add(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
  }) {
    return add?.call(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(restaurant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Replace value) replace,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _Add implements RestaurantCommand {
  factory _Add(Restaurant restaurant) = _$_Add;

  Restaurant get restaurant;
  @JsonKey(ignore: true)
  _$AddCopyWith<_Add> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RemoveCopyWith<$Res> {
  factory _$RemoveCopyWith(_Remove value, $Res Function(_Remove) then) =
      __$RemoveCopyWithImpl<$Res>;
  $Res call({Restaurant restaurant});

  $RestaurantCopyWith<$Res> get restaurant;
}

/// @nodoc
class __$RemoveCopyWithImpl<$Res> extends _$RestaurantCommandCopyWithImpl<$Res>
    implements _$RemoveCopyWith<$Res> {
  __$RemoveCopyWithImpl(_Remove _value, $Res Function(_Remove) _then)
      : super(_value, (v) => _then(v as _Remove));

  @override
  _Remove get _value => super._value as _Remove;

  @override
  $Res call({
    Object? restaurant = freezed,
  }) {
    return _then(_Remove(
      restaurant == freezed
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as Restaurant,
    ));
  }

  @override
  $RestaurantCopyWith<$Res> get restaurant {
    return $RestaurantCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value));
    });
  }
}

/// @nodoc

class _$_Remove implements _Remove {
  _$_Remove(this.restaurant);

  @override
  final Restaurant restaurant;

  @override
  String toString() {
    return 'RestaurantCommand.remove(restaurant: $restaurant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Remove &&
            const DeepCollectionEquality()
                .equals(other.restaurant, restaurant));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(restaurant));

  @JsonKey(ignore: true)
  @override
  _$RemoveCopyWith<_Remove> get copyWith =>
      __$RemoveCopyWithImpl<_Remove>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Restaurant restaurant) add,
    required TResult Function(Restaurant restaurant) remove,
    required TResult Function(Restaurant original, Restaurant updated) replace,
  }) {
    return remove(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
  }) {
    return remove?.call(restaurant);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(restaurant);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Replace value) replace,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements RestaurantCommand {
  factory _Remove(Restaurant restaurant) = _$_Remove;

  Restaurant get restaurant;
  @JsonKey(ignore: true)
  _$RemoveCopyWith<_Remove> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReplaceCopyWith<$Res> {
  factory _$ReplaceCopyWith(_Replace value, $Res Function(_Replace) then) =
      __$ReplaceCopyWithImpl<$Res>;
  $Res call({Restaurant original, Restaurant updated});

  $RestaurantCopyWith<$Res> get original;
  $RestaurantCopyWith<$Res> get updated;
}

/// @nodoc
class __$ReplaceCopyWithImpl<$Res> extends _$RestaurantCommandCopyWithImpl<$Res>
    implements _$ReplaceCopyWith<$Res> {
  __$ReplaceCopyWithImpl(_Replace _value, $Res Function(_Replace) _then)
      : super(_value, (v) => _then(v as _Replace));

  @override
  _Replace get _value => super._value as _Replace;

  @override
  $Res call({
    Object? original = freezed,
    Object? updated = freezed,
  }) {
    return _then(_Replace(
      original == freezed
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as Restaurant,
      updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as Restaurant,
    ));
  }

  @override
  $RestaurantCopyWith<$Res> get original {
    return $RestaurantCopyWith<$Res>(_value.original, (value) {
      return _then(_value.copyWith(original: value));
    });
  }

  @override
  $RestaurantCopyWith<$Res> get updated {
    return $RestaurantCopyWith<$Res>(_value.updated, (value) {
      return _then(_value.copyWith(updated: value));
    });
  }
}

/// @nodoc

class _$_Replace implements _Replace {
  _$_Replace(this.original, this.updated);

  @override
  final Restaurant original;
  @override
  final Restaurant updated;

  @override
  String toString() {
    return 'RestaurantCommand.replace(original: $original, updated: $updated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Replace &&
            const DeepCollectionEquality().equals(other.original, original) &&
            const DeepCollectionEquality().equals(other.updated, updated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(original),
      const DeepCollectionEquality().hash(updated));

  @JsonKey(ignore: true)
  @override
  _$ReplaceCopyWith<_Replace> get copyWith =>
      __$ReplaceCopyWithImpl<_Replace>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Restaurant restaurant) add,
    required TResult Function(Restaurant restaurant) remove,
    required TResult Function(Restaurant original, Restaurant updated) replace,
  }) {
    return replace(original, updated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
  }) {
    return replace?.call(original, updated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Restaurant restaurant)? add,
    TResult Function(Restaurant restaurant)? remove,
    TResult Function(Restaurant original, Restaurant updated)? replace,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(original, updated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Add value) add,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Replace value) replace,
  }) {
    return replace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
  }) {
    return replace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Add value)? add,
    TResult Function(_Remove value)? remove,
    TResult Function(_Replace value)? replace,
    required TResult orElse(),
  }) {
    if (replace != null) {
      return replace(this);
    }
    return orElse();
  }
}

abstract class _Replace implements RestaurantCommand {
  factory _Replace(Restaurant original, Restaurant updated) = _$_Replace;

  Restaurant get original;
  Restaurant get updated;
  @JsonKey(ignore: true)
  _$ReplaceCopyWith<_Replace> get copyWith =>
      throw _privateConstructorUsedError;
}
