import 'package:app/di/states/viewmodels.dart';
import 'package:app/feature/splash/splash_page_view.dart';
import 'package:app/navigation/route_paths.dart';
import 'package:app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_bloc/statemanagement_bloc.dart';

import 'splash_page_model.dart';

class SplashPage extends BasePage<SplashViewModel> {
  SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends BaseStatefulPage<SplashViewModel, SplashPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  SplashViewModel provideBloc() {
    return splashViewModelProvider;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    getViewModel().controller = _controller;
    getViewModel().controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacementNamed(context, RoutePaths.dashboard);
      }
    });
  }

  @override
  void onModelReady(SplashViewModel model) {
    // bind exception handler here.
    model.exceptionHandlerBinder.bind(context, super.stateObserver);
  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Color scaffoldBackgroundColor() {
    return ColorUtils.veryDarkGray;
  }

  @override
  Widget buildView(BuildContext context, SplashViewModel model) {
    return SplashPageView(model);
  }
}
