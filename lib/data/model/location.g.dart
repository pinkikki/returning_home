// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Location _$_$_LocationFromJson(Map<String, dynamic> json) {
  return _$_Location(
    userId: json['userId'] as String,
    position: json['position'] == null
        ? null
        : Position.fromJson(json['position'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'position': instance.position,
    };

_$_Position _$_$_PositionFromJson(Map<String, dynamic> json) {
  return _$_Position(
    geohash: json['geohash'] as String,
    geopoint: json['geopoint'] == null
        ? null
        : Geopoint.fromJson(json['geopoint'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PositionToJson(_$_Position instance) =>
    <String, dynamic>{
      'geohash': instance.geohash,
      'geopoint': instance.geopoint,
    };

_$_Geopoint _$_$_GeopointFromJson(Map<String, dynamic> json) {
  return _$_Geopoint(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_GeopointToJson(_$_Geopoint instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
