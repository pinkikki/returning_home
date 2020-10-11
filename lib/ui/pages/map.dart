import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';
import 'package:returning_home/ui/pages/push_notification_receiver.dart';

class MapPage extends StatefulHookWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  GoogleMapController _controller;
  CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 1,
  );

  bool _isLoading = true;
  Position _pokuriPosition;

  @override
  void initState() {
    super.initState();
    _listenPosition();
    _sendCurrentPosition();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 遷移途中でPush通知を許可するダイアログが出てしまうので、レンダリング後に実施する
      RemoteNotificationReceiver().configureRemotePush(context);
    });
  }


  Future<void> _listenPosition() async {
    final authState = context.read(authStateNotifierProvider);
    final collection = FirebaseFirestore.instance.collection('locations');
    final locations = await collection.get();
    final partner = locations.docs
        .firstWhere((e) => e.data()['userId'] != authState.state.account.userId)
        .data()['userId'] as String;
    final query = collection.where('userId', isEqualTo: partner);
    query.snapshots().listen(
      (event) async {
        final position =
            event.docs.first.data()['position'] as Map<String, dynamic>;
        final geopoint = position['geopoint'] as GeoPoint;
        // final currentPosition =
        //     await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        final currentPosition = Position(longitude: 0, latitude: 0);
        if (_isLoading) {
          _cameraPosition = CameraPosition(
            target: LatLng((currentPosition.latitude + geopoint.latitude) / 2,
                (currentPosition.longitude + geopoint.longitude) / 2),
            zoom: 10,
          );
        } else {
          await _controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                    (currentPosition.latitude + geopoint.latitude) / 2,
                    (currentPosition.longitude + geopoint.longitude) / 2),
                zoom: 10,
              ),
            ),
          );
        }
        setState(
          () {
            _pokuriPosition = Position(
                latitude: geopoint.latitude, longitude: geopoint.longitude);

            _isLoading = false;
          },
        );
      },
    );
  }

  void _sendCurrentPosition() {
    Stream<void>.periodic(const Duration(minutes: 10)).listen(
      (event) async {
        final authState = context.read(authStateNotifierProvider);
        final position =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        final geo = Geoflutterfire();
        final point = geo.point(
            latitude: position.latitude, longitude: position.longitude);
        await FirebaseFirestore.instance
            .collection('locations')
            .doc('1')
            .update(<String, dynamic>{
          'position': point.data,
          'userId': authState.state.account.userId,
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              initialCameraPosition: _cameraPosition,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              zoomControlsEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              markers: <Marker>{}..add(
                  Marker(
                    markerId: MarkerId('1'),
                    position: LatLng(
                        _pokuriPosition.latitude, _pokuriPosition.longitude),
                  ),
                ),
            ),
    );
  }
}
