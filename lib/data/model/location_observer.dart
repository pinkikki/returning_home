import 'package:returning_home/data/model/location.dart';
import 'package:returning_home/data/model/location_repository.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

class LocationObserver {
  LocationObserver(LocationRepository repo) : _location = BehaviorSubject() {
    repo.stream().pipe(_location);
  }

  final BehaviorSubject<Location> _location;

  ValueStream<Location> get locations => _location;

  void dispose() {
    _location.close();
  }
}
