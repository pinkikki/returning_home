// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

// ignore: unused_element
  _Location call({@required String userId, @required Position position}) {
    return _Location(
      userId: userId,
      position: position,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  String get userId;
  Position get position;

  $LocationCopyWith<Location> get copyWith;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({String userId, Position position});

  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object userId = freezed,
    Object position = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed ? _value.userId : userId as String,
      position: position == freezed ? _value.position : position as Position,
    ));
  }

  @override
  $PositionCopyWith<$Res> get position {
    if (_value.position == null) {
      return null;
    }
    return $PositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value));
    });
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({String userId, Position position});

  @override
  $PositionCopyWith<$Res> get position;
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object userId = freezed,
    Object position = freezed,
  }) {
    return _then(_Location(
      userId: userId == freezed ? _value.userId : userId as String,
      position: position == freezed ? _value.position : position as Position,
    ));
  }
}

/// @nodoc
class _$_Location with DiagnosticableTreeMixin implements _Location {
  const _$_Location({@required this.userId, @required this.position})
      : assert(userId != null),
        assert(position != null);

  @override
  final String userId;
  @override
  final Position position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Location(userId: $userId, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Location'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Location &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(position);

  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);
}

abstract class _Location implements Location {
  const factory _Location(
      {@required String userId, @required Position position}) = _$_Location;

  @override
  String get userId;
  @override
  Position get position;
  @override
  _$LocationCopyWith<_Location> get copyWith;
}

/// @nodoc
class _$PositionTearOff {
  const _$PositionTearOff();

// ignore: unused_element
  _Position call({@required String geohash, @required Geopoint geopoint}) {
    return _Position(
      geohash: geohash,
      geopoint: geopoint,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Position = _$PositionTearOff();

/// @nodoc
mixin _$Position {
  String get geohash;
  Geopoint get geopoint;

  $PositionCopyWith<Position> get copyWith;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res>;
  $Res call({String geohash, Geopoint geopoint});

  $GeopointCopyWith<$Res> get geopoint;
}

/// @nodoc
class _$PositionCopyWithImpl<$Res> implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  final Position _value;
  // ignore: unused_field
  final $Res Function(Position) _then;

  @override
  $Res call({
    Object geohash = freezed,
    Object geopoint = freezed,
  }) {
    return _then(_value.copyWith(
      geohash: geohash == freezed ? _value.geohash : geohash as String,
      geopoint: geopoint == freezed ? _value.geopoint : geopoint as Geopoint,
    ));
  }

  @override
  $GeopointCopyWith<$Res> get geopoint {
    if (_value.geopoint == null) {
      return null;
    }
    return $GeopointCopyWith<$Res>(_value.geopoint, (value) {
      return _then(_value.copyWith(geopoint: value));
    });
  }
}

/// @nodoc
abstract class _$PositionCopyWith<$Res> implements $PositionCopyWith<$Res> {
  factory _$PositionCopyWith(_Position value, $Res Function(_Position) then) =
      __$PositionCopyWithImpl<$Res>;
  @override
  $Res call({String geohash, Geopoint geopoint});

  @override
  $GeopointCopyWith<$Res> get geopoint;
}

/// @nodoc
class __$PositionCopyWithImpl<$Res> extends _$PositionCopyWithImpl<$Res>
    implements _$PositionCopyWith<$Res> {
  __$PositionCopyWithImpl(_Position _value, $Res Function(_Position) _then)
      : super(_value, (v) => _then(v as _Position));

  @override
  _Position get _value => super._value as _Position;

  @override
  $Res call({
    Object geohash = freezed,
    Object geopoint = freezed,
  }) {
    return _then(_Position(
      geohash: geohash == freezed ? _value.geohash : geohash as String,
      geopoint: geopoint == freezed ? _value.geopoint : geopoint as Geopoint,
    ));
  }
}

/// @nodoc
class _$_Position with DiagnosticableTreeMixin implements _Position {
  const _$_Position({@required this.geohash, @required this.geopoint})
      : assert(geohash != null),
        assert(geopoint != null);

  @override
  final String geohash;
  @override
  final Geopoint geopoint;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Position(geohash: $geohash, geopoint: $geopoint)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Position'))
      ..add(DiagnosticsProperty('geohash', geohash))
      ..add(DiagnosticsProperty('geopoint', geopoint));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Position &&
            (identical(other.geohash, geohash) ||
                const DeepCollectionEquality()
                    .equals(other.geohash, geohash)) &&
            (identical(other.geopoint, geopoint) ||
                const DeepCollectionEquality()
                    .equals(other.geopoint, geopoint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(geohash) ^
      const DeepCollectionEquality().hash(geopoint);

  @override
  _$PositionCopyWith<_Position> get copyWith =>
      __$PositionCopyWithImpl<_Position>(this, _$identity);
}

abstract class _Position implements Position {
  const factory _Position(
      {@required String geohash, @required Geopoint geopoint}) = _$_Position;

  @override
  String get geohash;
  @override
  Geopoint get geopoint;
  @override
  _$PositionCopyWith<_Position> get copyWith;
}

/// @nodoc
class _$GeopointTearOff {
  const _$GeopointTearOff();

// ignore: unused_element
  _Geopoint call({@required double latitude, @required double longitude}) {
    return _Geopoint(
      latitude: latitude,
      longitude: longitude,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Geopoint = _$GeopointTearOff();

/// @nodoc
mixin _$Geopoint {
  double get latitude;
  double get longitude;

  $GeopointCopyWith<Geopoint> get copyWith;
}

/// @nodoc
abstract class $GeopointCopyWith<$Res> {
  factory $GeopointCopyWith(Geopoint value, $Res Function(Geopoint) then) =
      _$GeopointCopyWithImpl<$Res>;
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$GeopointCopyWithImpl<$Res> implements $GeopointCopyWith<$Res> {
  _$GeopointCopyWithImpl(this._value, this._then);

  final Geopoint _value;
  // ignore: unused_field
  final $Res Function(Geopoint) _then;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

/// @nodoc
abstract class _$GeopointCopyWith<$Res> implements $GeopointCopyWith<$Res> {
  factory _$GeopointCopyWith(_Geopoint value, $Res Function(_Geopoint) then) =
      __$GeopointCopyWithImpl<$Res>;
  @override
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$GeopointCopyWithImpl<$Res> extends _$GeopointCopyWithImpl<$Res>
    implements _$GeopointCopyWith<$Res> {
  __$GeopointCopyWithImpl(_Geopoint _value, $Res Function(_Geopoint) _then)
      : super(_value, (v) => _then(v as _Geopoint));

  @override
  _Geopoint get _value => super._value as _Geopoint;

  @override
  $Res call({
    Object latitude = freezed,
    Object longitude = freezed,
  }) {
    return _then(_Geopoint(
      latitude: latitude == freezed ? _value.latitude : latitude as double,
      longitude: longitude == freezed ? _value.longitude : longitude as double,
    ));
  }
}

/// @nodoc
class _$_Geopoint with DiagnosticableTreeMixin implements _Geopoint {
  const _$_Geopoint({@required this.latitude, @required this.longitude})
      : assert(latitude != null),
        assert(longitude != null);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Geopoint(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Geopoint'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Geopoint &&
            (identical(other.latitude, latitude) ||
                const DeepCollectionEquality()
                    .equals(other.latitude, latitude)) &&
            (identical(other.longitude, longitude) ||
                const DeepCollectionEquality()
                    .equals(other.longitude, longitude)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(latitude) ^
      const DeepCollectionEquality().hash(longitude);

  @override
  _$GeopointCopyWith<_Geopoint> get copyWith =>
      __$GeopointCopyWithImpl<_Geopoint>(this, _$identity);
}

abstract class _Geopoint implements Geopoint {
  const factory _Geopoint(
      {@required double latitude, @required double longitude}) = _$_Geopoint;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  _$GeopointCopyWith<_Geopoint> get copyWith;
}
