import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:returning_home/data/model/location.dart';
import 'package:returning_home/data/model/location_repository.dart';

class FirebaseLocation implements LocationRepository {
  @override
  Stream<Location> stream() {
    return FirebaseFirestore.instance
        .collection('locations')
        .snapshots()
        .map((event) {
      final data = event.docs.first.data();
      final userId = data['userId'] as String;
      final position = data['position'] as Map<String, dynamic>;
      final geohash = position['geohash'] as String;
      final geopoint = position['geopoint'] as GeoPoint;
      return Location(
          position: Position(
              geohash: geohash,
              geopoint: Geopoint(
                latitude: geopoint.latitude,
                longitude: geopoint.longitude,
              )),
          userId: userId);
    });
  }
}
