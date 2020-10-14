import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';

@freezed
abstract class Location with _$Location {
  const factory Location({
    @required String userId,
    @required Position position,
  }) = _Location;
}

@freezed
abstract class Position with _$Position {
  const factory Position({
    @required String geohash,
    @required Geopoint geopoint,
  }) = _Position;
}

@freezed
abstract class Geopoint with _$Geopoint {
  const factory Geopoint({
    @required double latitude,
    @required double longitude,
  }) = _Geopoint;
}
