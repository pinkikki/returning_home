import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:returning_home/data/model/location.dart';
import 'package:returning_home/data/model/location_repository.dart';

class FirebaseLocation implements LocationRepository {
  final collection = FirebaseFirestore.instance.collection('locations');

  @override
  Stream<Location> streamByUserId(String userId) {
    // TODO byUserId
    return collection.snapshots().map((event) {
      final data = event.docs.first.data();
      return Location.fromJson(data);
    });
  }

  @override
  Future<String> fetchPartner(String userId) async {
    final locations = await collection.get();
    return locations.docs
        .firstWhere((e) => e.data()['userId'] != userId)
        .data()['userId'] as String;
  }
}
