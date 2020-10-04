import 'package:flutter/material.dart';
import 'package:returning_home/logger.dart';
import 'package:returning_home/main.dart';

import 'app.dart';
import 'locator.dart';

Future<void> run({@required Environment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();
  setupLocator(environment: environment);
  runApp(App());
}
