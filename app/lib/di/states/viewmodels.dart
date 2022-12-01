import 'package:app/feature/splash/splash_page_model.dart';
import 'package:flutter_errors/flutter_errors.dart';

import '../../dependencies.dart';

final splashViewModelProvider = SplashViewModel(
    getIt.get<String>(instanceName: "BaseUrl"),
    getIt.get<FlutterExceptionHandlerBinder>());
