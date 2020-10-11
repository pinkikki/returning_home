import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/error.dart';
import 'package:returning_home/ui/providers/navigator.dart';
import 'package:returning_home/ui/notifiers/error_notifier.dart';

class AppController {
  AppController(this.read) {
    error = read(errorNotifierProvider);
    navigatorKey = read(navigatorKeyProvider);
  }

  final Reader read;
  StateController<AppError> error;
  GlobalKey<NavigatorState> navigatorKey;
}
