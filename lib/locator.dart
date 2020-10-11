import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:returning_home/main.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({@required Environment environment}) async {
  _default();

  switch (environment) {
    case Environment.firebase:
      await _firebase();
      break;
    case Environment.local:
      _local();
      break;
  }
}

void _default() {
}

Future<void> _firebase() async {
  await Firebase.initializeApp();
  final analytics = FirebaseAnalytics();
  final observer = FirebaseAnalyticsObserver(analytics: analytics);

  locator
    ..registerLazySingleton<FirebaseAnalyticsObserver>(() => observer)
    ..registerLazySingleton<List<NavigatorObserver>>(
        () => <NavigatorObserver>[observer]);
}

void _local() {
  locator.registerLazySingleton<List<NavigatorObserver>>(
      () => <NavigatorObserver>[]);
}
