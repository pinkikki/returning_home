import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/notifiers/error_notifier.dart';
import 'package:returning_home/ui/notifiers/loading_notifier.dart';
import 'package:returning_home/ui/providers/navigator.dart';

abstract class AppController {
  AppController(this.read) {
    errorNotifier = read(errorStateNotifierProvider);
    loadingNotifier = read(loadingNotifierProvider);
    navigatorKey = read(navigatorKeyProvider);
  }

  final Reader read;
  StateController<ErrorState> errorNotifier;
  StateController<LoadingState> loadingNotifier;
  GlobalKey<NavigatorState> navigatorKey;
}

abstract class AppStateNotifier<T> extends StateNotifier<T> {
  AppStateNotifier(T state, this.read) : super(state) {
    errorNotifier = read(errorStateNotifierProvider);
    loadingNotifier = read(loadingNotifierProvider);
    navigatorKey = read(navigatorKeyProvider);
  }

  final Reader read;
  StateController<ErrorState> errorNotifier;
  StateController<LoadingState> loadingNotifier;
  GlobalKey<NavigatorState> navigatorKey;
}
