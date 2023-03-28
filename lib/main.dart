import 'package:flutter/material.dart';

import 'core/app.dart';
import 'core/services/services_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(const MyApp());
}

