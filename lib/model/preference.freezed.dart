// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'preference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'none':
      return _None.fromJson(json);
    case 'like':
      return _Like.fromJson(json);
    case 'love':
      return _Love.fromJson(json);
    case 'favorite':
      return _Favorite.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Preference',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$PreferenceTearOff {
  const _$PreferenceTearOff();

  _None none([String label = "None", int weight = 0]) {
    return _None(
      label,
      weight,
    );
  }

  _Like like([String label = "Like It", int weight = 1]) {
    return _Like(
      label,
      weight,
    );
  }

  _Love love([String label = "Love It", int weight = 2]) {
    return _Love(
      label,
      weight,
    );
  }

  _Favorite favorite([String label = "Favorite", int weight = 3]) {
    return _Favorite(
      label,
      weight,
    );
  }

  Preference fromJson(Map<String, Object?> json) {
    return Preference.fromJson(json);
  }
}

/// @nodoc
const $Preference = _$PreferenceTearOff();

/// @nodoc
mixin _$Preference {
  String get label => throw _privateConstructorUsedError;
  int get weight => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label, int weight) none,
    required TResult Function(String label, int weight) like,
    required TResult Function(String label, int weight) love,
    required TResult Function(String label, int weight) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Like value) like,
    required TResult Function(_Love value) love,
    required TResult Function(_Favorite value) favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreferenceCopyWith<Preference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceCopyWith<$Res> {
  factory $PreferenceCopyWith(
          Preference value, $Res Function(Preference) then) =
      _$PreferenceCopyWithImpl<$Res>;
  $Res call({String label, int weight});
}

/// @nodoc
class _$PreferenceCopyWithImpl<$Res> implements $PreferenceCopyWith<$Res> {
  _$PreferenceCopyWithImpl(this._value, this._then);

  final Preference _value;
  // ignore: unused_field
  final $Res Function(Preference) _then;

  @override
  $Res call({
    Object? label = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      label: label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NoneCopyWith<$Res> implements $PreferenceCopyWith<$Res> {
  factory _$NoneCopyWith(_None value, $Res Function(_None) then) =
      __$NoneCopyWithImpl<$Res>;
  @override
  $Res call({String label, int weight});
}

/// @nodoc
class __$NoneCopyWithImpl<$Res> extends _$PreferenceCopyWithImpl<$Res>
    implements _$NoneCopyWith<$Res> {
  __$NoneCopyWithImpl(_None _value, $Res Function(_None) _then)
      : super(_value, (v) => _then(v as _None));

  @override
  _None get _value => super._value as _None;

  @override
  $Res call({
    Object? label = freezed,
    Object? weight = freezed,
  }) {
    return _then(_None(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_None implements _None {
  _$_None([this.label = "None", this.weight = 0, String? $type])
      : $type = $type ?? 'none';

  factory _$_None.fromJson(Map<String, dynamic> json) => _$$_NoneFromJson(json);

  @JsonKey()
  @override
  final String label;
  @JsonKey()
  @override
  final int weight;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Preference.none(label: $label, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _None &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$NoneCopyWith<_None> get copyWith =>
      __$NoneCopyWithImpl<_None>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label, int weight) none,
    required TResult Function(String label, int weight) like,
    required TResult Function(String label, int weight) love,
    required TResult Function(String label, int weight) favorite,
  }) {
    return none(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
  }) {
    return none?.call(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(label, weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Like value) like,
    required TResult Function(_Love value) love,
    required TResult Function(_Favorite value) favorite,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NoneToJson(this);
  }
}

abstract class _None implements Preference {
  factory _None([String label, int weight]) = _$_None;

  factory _None.fromJson(Map<String, dynamic> json) = _$_None.fromJson;

  @override
  String get label;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$NoneCopyWith<_None> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikeCopyWith<$Res> implements $PreferenceCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) then) =
      __$LikeCopyWithImpl<$Res>;
  @override
  $Res call({String label, int weight});
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> extends _$PreferenceCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(_Like _value, $Res Function(_Like) _then)
      : super(_value, (v) => _then(v as _Like));

  @override
  _Like get _value => super._value as _Like;

  @override
  $Res call({
    Object? label = freezed,
    Object? weight = freezed,
  }) {
    return _then(_Like(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  _$_Like([this.label = "Like It", this.weight = 1, String? $type])
      : $type = $type ?? 'like';

  factory _$_Like.fromJson(Map<String, dynamic> json) => _$$_LikeFromJson(json);

  @JsonKey()
  @override
  final String label;
  @JsonKey()
  @override
  final int weight;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Preference.like(label: $label, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Like &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label, int weight) none,
    required TResult Function(String label, int weight) like,
    required TResult Function(String label, int weight) love,
    required TResult Function(String label, int weight) favorite,
  }) {
    return like(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
  }) {
    return like?.call(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(label, weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Like value) like,
    required TResult Function(_Love value) love,
    required TResult Function(_Favorite value) favorite,
  }) {
    return like(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
  }) {
    return like?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikeToJson(this);
  }
}

abstract class _Like implements Preference {
  factory _Like([String label, int weight]) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  String get label;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$LikeCopyWith<_Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoveCopyWith<$Res> implements $PreferenceCopyWith<$Res> {
  factory _$LoveCopyWith(_Love value, $Res Function(_Love) then) =
      __$LoveCopyWithImpl<$Res>;
  @override
  $Res call({String label, int weight});
}

/// @nodoc
class __$LoveCopyWithImpl<$Res> extends _$PreferenceCopyWithImpl<$Res>
    implements _$LoveCopyWith<$Res> {
  __$LoveCopyWithImpl(_Love _value, $Res Function(_Love) _then)
      : super(_value, (v) => _then(v as _Love));

  @override
  _Love get _value => super._value as _Love;

  @override
  $Res call({
    Object? label = freezed,
    Object? weight = freezed,
  }) {
    return _then(_Love(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Love implements _Love {
  _$_Love([this.label = "Love It", this.weight = 2, String? $type])
      : $type = $type ?? 'love';

  factory _$_Love.fromJson(Map<String, dynamic> json) => _$$_LoveFromJson(json);

  @JsonKey()
  @override
  final String label;
  @JsonKey()
  @override
  final int weight;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Preference.love(label: $label, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Love &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$LoveCopyWith<_Love> get copyWith =>
      __$LoveCopyWithImpl<_Love>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label, int weight) none,
    required TResult Function(String label, int weight) like,
    required TResult Function(String label, int weight) love,
    required TResult Function(String label, int weight) favorite,
  }) {
    return love(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
  }) {
    return love?.call(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
    required TResult orElse(),
  }) {
    if (love != null) {
      return love(label, weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Like value) like,
    required TResult Function(_Love value) love,
    required TResult Function(_Favorite value) favorite,
  }) {
    return love(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
  }) {
    return love?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
    required TResult orElse(),
  }) {
    if (love != null) {
      return love(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoveToJson(this);
  }
}

abstract class _Love implements Preference {
  factory _Love([String label, int weight]) = _$_Love;

  factory _Love.fromJson(Map<String, dynamic> json) = _$_Love.fromJson;

  @override
  String get label;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$LoveCopyWith<_Love> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FavoriteCopyWith<$Res> implements $PreferenceCopyWith<$Res> {
  factory _$FavoriteCopyWith(_Favorite value, $Res Function(_Favorite) then) =
      __$FavoriteCopyWithImpl<$Res>;
  @override
  $Res call({String label, int weight});
}

/// @nodoc
class __$FavoriteCopyWithImpl<$Res> extends _$PreferenceCopyWithImpl<$Res>
    implements _$FavoriteCopyWith<$Res> {
  __$FavoriteCopyWithImpl(_Favorite _value, $Res Function(_Favorite) _then)
      : super(_value, (v) => _then(v as _Favorite));

  @override
  _Favorite get _value => super._value as _Favorite;

  @override
  $Res call({
    Object? label = freezed,
    Object? weight = freezed,
  }) {
    return _then(_Favorite(
      label == freezed
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite implements _Favorite {
  _$_Favorite([this.label = "Favorite", this.weight = 3, String? $type])
      : $type = $type ?? 'favorite';

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  @JsonKey()
  @override
  final String label;
  @JsonKey()
  @override
  final int weight;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Preference.favorite(label: $label, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Favorite &&
            const DeepCollectionEquality().equals(other.label, label) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(label),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$FavoriteCopyWith<_Favorite> get copyWith =>
      __$FavoriteCopyWithImpl<_Favorite>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String label, int weight) none,
    required TResult Function(String label, int weight) like,
    required TResult Function(String label, int weight) love,
    required TResult Function(String label, int weight) favorite,
  }) {
    return favorite(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
  }) {
    return favorite?.call(label, weight);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String label, int weight)? none,
    TResult Function(String label, int weight)? like,
    TResult Function(String label, int weight)? love,
    TResult Function(String label, int weight)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(label, weight);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None value) none,
    required TResult Function(_Like value) like,
    required TResult Function(_Love value) love,
    required TResult Function(_Favorite value) favorite,
  }) {
    return favorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
  }) {
    return favorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None value)? none,
    TResult Function(_Like value)? like,
    TResult Function(_Love value)? love,
    TResult Function(_Favorite value)? favorite,
    required TResult orElse(),
  }) {
    if (favorite != null) {
      return favorite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(this);
  }
}

abstract class _Favorite implements Preference {
  factory _Favorite([String label, int weight]) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  String get label;
  @override
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$FavoriteCopyWith<_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
