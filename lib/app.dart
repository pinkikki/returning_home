import 'package:flutter/material.dart';
import 'package:returning_home/locator.dart';
import 'package:returning_home/ui/pages/login.dart';
import 'package:returning_home/ui/pages/navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: locator.get<NavigationController>().navigationKey,
      navigatorObservers: locator.get<List<NavigatorObserver>>(),
      home: Login(),
    );
  }
}
