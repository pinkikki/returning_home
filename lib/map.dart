import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(0, 0),
    zoom: 1,
  );

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialPosition();
  }

  void _initialPosition() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // TODO 相手の位置情報を取得する。とりあえず、渋谷にする。
    LatLng shibuyaPosition = LatLng(35.658034, 139.701636);

    setState(() {
      _cameraPosition = CameraPosition(
        target: LatLng((position.latitude + shibuyaPosition.latitude) / 2,
            (position.longitude + shibuyaPosition.longitude) / 2),
        zoom: 10,
      );
      isLoading = false;
    });
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
                _controller.complete(controller);
              },
            ),
    );
  }
}
