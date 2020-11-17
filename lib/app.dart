import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/data/providers.dart';
import 'package:returning_home/locator.dart';
import 'package:returning_home/routes.dart';
import 'package:returning_home/ui/notifiers/auth_notifier.dart';
import 'package:returning_home/ui/pages/login.dart';
import 'package:returning_home/ui/pages/top.dart';
import 'package:returning_home/ui/providers/navigator.dart';
import 'package:returning_home/ui/widgets/loading.dart';

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
      home: ProviderContainer().read(authProvider).isAuthenticated()
          ? _InPreparationPage()
          : Login(),
    );
  }
}

class _InPreparationPage extends StatefulHookWidget {
  @override
  State<StatefulWidget> createState() => _InPreparationPageState();
}

class _InPreparationPageState extends State<_InPreparationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final auth = context.read(authProvider);
        context.read(authStateNotifierProvider).state =
            await auth.getAuthState();
        await context
            .read(navigatorKeyProvider)
            .currentState
            .pushNamedAndRemoveUntil(Top.routeName, (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loading(),
    );
  }
}
