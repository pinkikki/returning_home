import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/data/firebase/firebase_auth.dart';
import 'package:returning_home/data/firebase/firebase_location.dart';
import 'package:returning_home/data/model/location_observer.dart';
import 'package:returning_home/data/model/location_repository.dart';
import 'package:returning_home/frameworks/auth.dart';

final authProvider = Provider<Auth>((ref) => FirebaseEmailAndPasswordAuth());

final locationRepositoryProvider =
    Provider<LocationRepository>((ref) => FirebaseLocation());

final locationObserverProvider = Provider.family<LocationObserver, String>(
    (ref, userId) =>
        LocationObserver(ref.read(locationRepositoryProvider), userId));
