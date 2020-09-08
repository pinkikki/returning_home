import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Push extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PushState();
}

class PushState extends State<Push> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    _configureRemotePush();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(),
      ),
    );
  }

  void _configureRemotePush() async {

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        _buildDialog(context, 'onMessage');
        return Future.value();
      },
      onResume: (Map<String, dynamic> message) {
        _buildDialog(context, 'onResume');
        return Future.value();
      },
//      onBackgroundMessage: (message) {
//        print('onBackgroundMessage');
//        print(message);
//        return Future.value();
//      },
      onLaunch: (Map<String, dynamic> message) {
        _buildDialog(context, 'onLaunch');
        return Future.value();
      },
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
  }
    void _buildDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new Text("Message: $message"),
          actions: <Widget>[
            new FlatButton(
              child: const Text('CLOSE'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            new FlatButton(
              child: const Text('SHOW'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      }
    );
  }
}
