import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    @required String userId,
    @required Position position,
  }) = _Location;
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

@freezed
abstract class Position with _$Position {
  const factory Position({
    @required String geohash,
    @required Geopoint geopoint,
  }) = _Position;
  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
abstract class Geopoint with _$Geopoint {
  const factory Geopoint({
    @required double latitude,
    @required double longitude,
  }) = _Geopoint;
  factory Geopoint.fromJson(Map<String, dynamic> json) =>
      _$GeopointFromJson(json);
}
