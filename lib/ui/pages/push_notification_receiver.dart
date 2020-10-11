import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/providers/navigator.dart';

class RemoteNotificationReceiver {
  factory RemoteNotificationReceiver() => _instance;

  RemoteNotificationReceiver._internal();

  static final RemoteNotificationReceiver _instance =
      RemoteNotificationReceiver._internal();

  bool isConfigured = false;

  Future<void> configureRemotePush(BuildContext context) async {
    try {
      // onLaunchが何度もコールバックされてしまう現象の対処
      // https://github.com/FirebaseExtended/flutterfire/issues/1060
      // https://github.com/flutter/flutter/issues/32698
      // FIXME: FirebaseMessagingをシングルトンにすれば良い気がする
      if (!isConfigured) {
        final c =
            context.read(navigatorKeyProvider).currentState.descendantContext;
        final firebaseMessaging = FirebaseMessaging()
          ..configure(
            onMessage: (Map<String, dynamic> message) {
              _buildDialog(c, 'onMessage. $message');
              return Future<void>.value();
            },
            onResume: (Map<String, dynamic> message) {
              _buildDialog(c, 'onResume. $message');
              return Future<void>.value();
            },
            onLaunch: (Map<String, dynamic> message) {
              _buildDialog(c, 'onLaunch. $message');
              return Future<void>.value();
            },
            // バックグラウンドで処理をしたい場合
            onBackgroundMessage: onBackgroundMessage,
          )
          ..requestNotificationPermissions(
            const IosNotificationSettings(
              sound: true,
              badge: true,
              alert: true,
            ),
          )
          ..onIosSettingsRegistered.listen(
            (IosNotificationSettings setting) {
              debugPrint('Settings registered: $setting');
            },
          );

        await firebaseMessaging.subscribeToTopic('/topics/all');

        print(await firebaseMessaging.getToken());

        isConfigured = true;
      }
    } on Exception catch (e) {
      _buildDialog(context, e.toString());
    }
  }

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    print('onBackgroundMessage');
  }

  void _buildDialog(BuildContext context, String message) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Message: $message'),
          actions: <Widget>[
            FlatButton(
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
