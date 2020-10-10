import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/main.dart';
import 'package:returning_home/logger.dart';

import 'app.dart';
import 'locator.dart';

Future<void> run({@required Environment environment}) async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();
  await setupLocator(environment: environment);
  runApp(
    ProviderScope(
      child: App(),
    ),
  );
}
