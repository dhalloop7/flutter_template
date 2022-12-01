import 'package:dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';

import 'dependencies.dart';
import 'myapp.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(DependencyConfigurationContext());
  runApp(const MyApp());
}
