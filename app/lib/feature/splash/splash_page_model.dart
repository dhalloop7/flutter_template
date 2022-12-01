import 'dart:async';

import "package:equatable/equatable.dart";
import 'package:flutter/material.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:statemanagement_bloc/statemanagement_bloc.dart';

@injectable
class SplashViewModel extends BasePageViewModel<SplashEvent, SplashState> {
  final String myBaseUrl;
  final StreamController<bool> _navigateToDashboardController =
      StreamController();
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  late Timer future;

  AnimationController? controller;

  SplashViewModel(@factoryParam this.myBaseUrl, this.exceptionHandlerBinder)
      : super(SplashEntryState()) {
    future = Timer(const Duration(seconds: 2), () async {
      _navigateToDashboardController.sink.add(true);
      _navigateToDashboardController.close();
    });
  }

  Stream<bool> navigateToDashboard() => _navigateToDashboardController.stream;

  void test() {
    exceptionHandlerBinder.handle(block: () {
      debugPrint("exceptionHandlerBinder start");
      throw const FormatException("Something is wrong");
      /*throw NetworkError(
          httpError: 1,
          message: "message Testing another error",
          cause: Exception("Testing another error"));*/
      /*var name = await Future.delayed(
        const Duration(seconds: 2),
        () => //"my name",
            throw const FormatException("sad"),
      );*/
      //print("name >> $name");
    }).execute();

/*
    exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).finallyIt(block: () {
      // Optional finally block
      // Some code
    }).execute();
*/

    /* exceptionHandlerBinder.handle(block: () {
      // serverRequest(); // Some dangerous code that can throw an exception
    }).catchIt<FormatException>((e) {
      // Optional finally block
      // Some code
      return false;
    }).execute();*/
  }
}

class SplashEvent extends BaseEvent {}

class SplashState extends BaseState with EquatableMixin {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class SplashEntryState extends SplashState {}
