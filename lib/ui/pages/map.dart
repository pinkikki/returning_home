import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/controllers/map_controller.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';
import 'package:returning_home/ui/pages/push_notification_receiver.dart';
import 'package:returning_home/ui/widgets/base.dart';
import 'package:returning_home/ui/widgets/loading.dart';

class MapPage extends StatefulHookWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
    _sendCurrentPosition();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // 遷移途中でPush通知を許可するダイアログが出てしまうので、レンダリング後に実施する
      RemoteNotificationReceiver().configureRemotePush(context);
    });
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
    final mapController = useProvider<MapController>(mapControllerProvider);
    final partnerGeopoint = useProvider(
        mapControllerProvider.state.select((s) => s.partnerGeopoint));
    final cameraPosition = useProvider(
        mapControllerProvider.state.select((s) => s.cameraPosition));
    final isLoading =
        useProvider(mapControllerProvider.state.select((s) => s.isLoading));
    return Scaffold(
      body: BaseViewOnScaffold(
        child: isLoading
            ? Loading()
            : GoogleMap(
                initialCameraPosition: cameraPosition,
                myLocationEnabled: true,
                mapType: MapType.normal,
                compassEnabled: true,
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  mapController.googleMapController = controller;
                },
                markers: <Marker>{}..add(
                    Marker(
                      markerId: MarkerId('1'),
                      position: LatLng(
                          partnerGeopoint.latitude, partnerGeopoint.longitude),
                    ),
                  ),
              ),
      ),
    );
  }
}
