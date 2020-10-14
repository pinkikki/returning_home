// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'map_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$MapStateTearOff {
  const _$MapStateTearOff();

// ignore: unused_element
  _MapState call(
      {Geopoint partnerGeopoint,
      CameraPosition cameraPosition =
          const CameraPosition(target: LatLng(0, 0), zoom: 1)}) {
    return _MapState(
      partnerGeopoint: partnerGeopoint,
      cameraPosition: cameraPosition,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $MapState = _$MapStateTearOff();

/// @nodoc
mixin _$MapState {
  Geopoint get partnerGeopoint;
  CameraPosition get cameraPosition;

  $MapStateCopyWith<MapState> get copyWith;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res>;
  $Res call({Geopoint partnerGeopoint, CameraPosition cameraPosition});

  $GeopointCopyWith<$Res> get partnerGeopoint;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res> implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  final MapState _value;
  // ignore: unused_field
  final $Res Function(MapState) _then;

  @override
  $Res call({
    Object partnerGeopoint = freezed,
    Object cameraPosition = freezed,
  }) {
    return _then(_value.copyWith(
      partnerGeopoint: partnerGeopoint == freezed
          ? _value.partnerGeopoint
          : partnerGeopoint as Geopoint,
      cameraPosition: cameraPosition == freezed
          ? _value.cameraPosition
          : cameraPosition as CameraPosition,
    ));
  }

  @override
  $GeopointCopyWith<$Res> get partnerGeopoint {
    if (_value.partnerGeopoint == null) {
      return null;
    }
    return $GeopointCopyWith<$Res>(_value.partnerGeopoint, (value) {
      return _then(_value.copyWith(partnerGeopoint: value));
    });
  }
}

/// @nodoc
abstract class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) then) =
      __$MapStateCopyWithImpl<$Res>;
  @override
  $Res call({Geopoint partnerGeopoint, CameraPosition cameraPosition});

  @override
  $GeopointCopyWith<$Res> get partnerGeopoint;
}

/// @nodoc
class __$MapStateCopyWithImpl<$Res> extends _$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(_MapState _value, $Res Function(_MapState) _then)
      : super(_value, (v) => _then(v as _MapState));

  @override
  _MapState get _value => super._value as _MapState;

  @override
  $Res call({
    Object partnerGeopoint = freezed,
    Object cameraPosition = freezed,
  }) {
    return _then(_MapState(
      partnerGeopoint: partnerGeopoint == freezed
          ? _value.partnerGeopoint
          : partnerGeopoint as Geopoint,
      cameraPosition: cameraPosition == freezed
          ? _value.cameraPosition
          : cameraPosition as CameraPosition,
    ));
  }
}

/// @nodoc
class _$_MapState with DiagnosticableTreeMixin implements _MapState {
  const _$_MapState(
      {this.partnerGeopoint,
      this.cameraPosition =
          const CameraPosition(target: LatLng(0, 0), zoom: 1)})
      : assert(cameraPosition != null);

  @override
  final Geopoint partnerGeopoint;
  @JsonKey(defaultValue: const CameraPosition(target: LatLng(0, 0), zoom: 1))
  @override
  final CameraPosition cameraPosition;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MapState(partnerGeopoint: $partnerGeopoint, cameraPosition: $cameraPosition)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MapState'))
      ..add(DiagnosticsProperty('partnerGeopoint', partnerGeopoint))
      ..add(DiagnosticsProperty('cameraPosition', cameraPosition));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MapState &&
            (identical(other.partnerGeopoint, partnerGeopoint) ||
                const DeepCollectionEquality()
                    .equals(other.partnerGeopoint, partnerGeopoint)) &&
            (identical(other.cameraPosition, cameraPosition) ||
                const DeepCollectionEquality()
                    .equals(other.cameraPosition, cameraPosition)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(partnerGeopoint) ^
      const DeepCollectionEquality().hash(cameraPosition);

  @override
  _$MapStateCopyWith<_MapState> get copyWith =>
      __$MapStateCopyWithImpl<_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {Geopoint partnerGeopoint, CameraPosition cameraPosition}) = _$_MapState;

  @override
  Geopoint get partnerGeopoint;
  @override
  CameraPosition get cameraPosition;
  @override
  _$MapStateCopyWith<_MapState> get copyWith;
}
