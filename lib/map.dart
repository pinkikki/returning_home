import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController _controller;
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 1,
  );

  bool isLoading = true;
  Position _pokuriPosition;

  @override
  void initState() {
    super.initState();
    _initialPosition();
    _sendCurrentPosition();
  }

  void _initialPosition() async {
    Query query = FirebaseFirestore.instance
        .collection('locations')
        .where('userId', isEqualTo: 'pokuri');
    query.snapshots().listen(
      (event) async {
        final position = event.docs[0].data()['position'];
        final currentPosition =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        if (isLoading) {
          _cameraPosition = CameraPosition(
            target: LatLng(
                (currentPosition.latitude + position['geopoint'].latitude) / 2,
                (currentPosition.longitude + position['geopoint'].longitude) /
                    2),
            zoom: 10,
          );
        } else {
          _controller.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                    (currentPosition.latitude + position['geopoint'].latitude) /
                        2,
                    (currentPosition.longitude +
                            position['geopoint'].longitude) /
                        2),
                zoom: 10.0,
              ),
            ),
          );
        }
        setState(
          () {
            _pokuriPosition = Position(
                latitude: position['geopoint'].latitude,
                longitude: position['geopoint'].longitude);

            isLoading = false;
          },
        );
      },
    );
  }

  void _sendCurrentPosition() {
    Stream.periodic(Duration(seconds: 10)).listen(
      (event) async {
        final position =
            await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        final geo = Geoflutterfire();
        final point = geo.point(
            latitude: position.latitude, longitude: position.longitude);
        await FirebaseFirestore.instance
            .collection('locations')
            .doc('1')
            .update({'position': point.data, 'userId': 'pinkikki'});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: isLoading
          ? Center(
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
              markers: Set()
                ..add(
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
