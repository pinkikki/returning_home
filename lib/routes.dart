import 'package:flutter/cupertino.dart';
import 'package:returning_home/ui/pages/login.dart';
import 'package:returning_home/ui/pages/top.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Login.routeName:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Login(),
        );
      case Top.routeName:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: Top(),
        );
    }
    return _getPageRoute(
      routeName: settings.name,
      viewToShow: Container(),
    );
  }

  static PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
    return CupertinoPageRoute<void>(
        settings: RouteSettings(
          name: routeName,
        ),
        builder: (_) => viewToShow);
  }
}
