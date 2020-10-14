import 'package:returning_home/data/model/location.dart';

abstract class LocationRepository {
  Stream<Location> streamByUserId(String userId);

  // FIXME: 別のリポジトリに移動
  Future<String> fetchPartner(String userId);
}
