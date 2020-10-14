import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/data/model/location.dart';
import 'package:returning_home/data/model/location_repository.dart';
import 'package:returning_home/data/providers.dart';
import 'package:returning_home/frameworks/auth.dart';
import 'package:returning_home/ui/controllers/app_controller.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';
import 'package:rxdart/streams.dart';

part 'map_controller.freezed.dart';

final mapControllerProvider =
    StateNotifierProvider((ref) => MapController(ref.read));

class MapController extends AppStateNotifier<MapState> {
  MapController(Reader read) : super(const MapState(), read) {
    _authState = read(authStateNotifierProvider);
    _locationRepository = read(locationRepositoryProvider);
    _init();
  }

  StateController<AuthState> _authState;
  LocationRepository _locationRepository;

  ValueStream<Location> _location;

  ValueStream<Location> get location => _location;

  GoogleMapController googleMapController;

  Future<void> _init() async {
    // TODO これがあるとエラーになる
    // loadingNotifier.state =
    //     loadingNotifier.state.copyWith(loadingOnInitialization: true);
    final partner =
        await _locationRepository.fetchPartner(_authState.state.account.userId);
    _location = read(locationObserverProvider.call(partner)).location;

    // final currentPosition =
    //     await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    const currentPosition =
        Geopoint(latitude: 35.6598003, longitude: 139.7023894);

    _location.listen((event) async {
      final geopoint = event.position.geopoint;
      if (loadingNotifier.state.loadingOnInitialization) {
        state = state.copyWith(
            cameraPosition: CameraPosition(
          target: LatLng((currentPosition.latitude + geopoint.latitude) / 2,
              (currentPosition.longitude + geopoint.longitude) / 2),
          zoom: 10,
        ));
      } else {
        await googleMapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng((currentPosition.latitude + geopoint.latitude) / 2,
                  (currentPosition.longitude + geopoint.longitude) / 2),
              zoom: 10,
            ),
          ),
        );
      }

      state = state.copyWith(
          partnerGeopoint: Geopoint(
              latitude: geopoint.latitude, longitude: geopoint.longitude));

      loadingNotifier.state =
          loadingNotifier.state.copyWith(loadingOnInitialization: false);
    });
  }
}

@freezed
abstract class MapState with _$MapState {
  const factory MapState({
    Geopoint partnerGeopoint,
    @Default(
      CameraPosition(
        target: LatLng(0, 0),
        zoom: 1,
      ),
    )
        CameraPosition cameraPosition,
  }) = _MapState;
}
