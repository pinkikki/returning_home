import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:returning_home/auth.dart';
import 'package:returning_home/push_notification_receiver.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  GoogleMapController _controller;
  CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(0, 0),
    zoom: 1,
  );

  bool isLoading = true;
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
    final auth = context.read<Auth>();
    final collection = FirebaseFirestore.instance.collection('locations');
    final locations = await collection.get();
    final partner = locations.docs
        .firstWhere((e) => e.data()['userId'] != auth.credential.user.email)
        .data()['userId'] as String;
    final query = collection.where('userId', isEqualTo: partner);
    query.snapshots().listen(
      (event) async {
        final position =
            event.docs.first.data()['position'] as Map<String, dynamic>;
        final geopoint = position['geopoint'] as GeoFirePoint;
        final currentPosition =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        if (isLoading) {
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

            isLoading = false;
          },
        );
      },
    );
  }

  void _sendCurrentPosition() {
    Stream<void>.periodic(const Duration(minutes: 10)).listen(
      (event) async {
        final auth = context.read<Auth>();
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
          'userId': auth.credential.user.email
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
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
