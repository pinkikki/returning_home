import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/providers/navigator.dart';
import 'package:returning_home/locator.dart';
import 'package:returning_home/routes.dart';
import 'package:returning_home/ui/pages/login.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Returning Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: useProvider(navigatorKeyProvider),
      navigatorObservers: locator.get<List<NavigatorObserver>>(),
      onGenerateRoute: Routes.generateRoute,
      home: Login(),
    );
  }
}
