import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:statemanagement_bloc/statemanagement_bloc.dart';

import 'splash_page_model.dart';

class SplashPageView extends BasePageViewWidget<SplashViewModel> {
  SplashPageView(SplashViewModel model) : super(model);

  @override
  Widget build(BuildContext context, model) {
    return Center(
        child: Lottie.asset(
      'assets/animations/splash_animation.json',
      controller: model.controller,
      onLoaded: (composition) {
        model.controller
          ?..duration = composition.duration
          ..forward();
      },
    ));
  }
}
