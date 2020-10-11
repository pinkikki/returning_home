import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/frameworks/error.dart';
import 'package:returning_home/ui/notifiers/error_notifier.dart';
import 'package:returning_home/ui/notifiers/loading_notifier.dart';
import 'package:returning_home/ui/providers/navigator.dart';

class AppController {
  AppController(this.read) {
    errorNotifier = read(errorStateNotifierProvider);
    loadingNotifier = read(loadingNotifierProvider);
    navigatorKey = read(navigatorKeyProvider);
  }

  final Reader read;
  StateController<AppError> errorNotifier;
  StateController<LoadingState> loadingNotifier;
  GlobalKey<NavigatorState> navigatorKey;
}
