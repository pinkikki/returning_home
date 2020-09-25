import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:returning_home/navigation.dart';

class RemoteNotificationReceiver {
  static final RemoteNotificationReceiver _instance =
      RemoteNotificationReceiver._internal();

  factory RemoteNotificationReceiver() => _instance;

  RemoteNotificationReceiver._internal();

  bool isConfigured = false;

  void configureRemotePush(BuildContext context) async {
    try {
      // onLaunchが何度もコールバックされてしまう現象の対処
      // https://github.com/FirebaseExtended/flutterfire/issues/1060
      // https://github.com/flutter/flutter/issues/32698
      if (!isConfigured) {
        final navigationController =
            Provider.of<NavigationController>(context, listen: false);
        final c =
            navigationController.navigationKey.currentState.overlay.context;
        final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
        _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) {
            _buildDialog(c, 'onMessage. $message');
            return Future.value();
          },
          onResume: (Map<String, dynamic> message) {
            _buildDialog(c, 'onResume. $message');
            return Future.value();
          },
          onLaunch: (Map<String, dynamic> message) {
            _buildDialog(c, 'onLaunch. $message');
            return Future.value();
          },
          // バックグラウンドで処理をしたい場合
          onBackgroundMessage: onBackgroundMessage,
        );

        _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(
            sound: true,
            badge: true,
            alert: true,
          ),
        );

        _firebaseMessaging.onIosSettingsRegistered.listen(
          (IosNotificationSettings setting) {
            debugPrint('Settings registered: $setting');
          },
        );

        print(await _firebaseMessaging.getToken());

        _firebaseMessaging.subscribeToTopic('/topics/all');
        isConfigured = true;
      }
    } catch (e) {
      _buildDialog(context, e.toString());
    }
  }

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    print('onBackgroundMessage');
  }

  void _buildDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new Text('Message: $message'),
          actions: <Widget>[
            new FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );
  }
}
