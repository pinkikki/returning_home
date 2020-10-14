import 'package:returning_home/data/model/location.dart';

abstract class LocationRepository {
  Stream<Location> stream();
}
