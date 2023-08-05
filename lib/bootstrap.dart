// ignore_for_file: strict_raw_type

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/config/app/app.dart';
import 'package:recipe_app/core/utils/logger.dart';
import 'package:recipe_app/presentation/injector/injector.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    loggerError('''
    ${bloc.runtimeType}
    error: $error
    stackTrace: $stackTrace
    ''');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    loggerDebug('''
    ${bloc.runtimeType}
    currentState: ${change.currentState}
    nextState: ${change.nextState}
    ''');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    loggerDebug('''
    ${bloc.runtimeType}
    event: ${transition.event}
    state: ${transition.currentState}
    ''');
  }
}

void bootstrap() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDepedencies();
  FlutterError.onError = (FlutterErrorDetails details) {
    loggerError(details.exceptionAsString(), details.exception, details.stack);
  };
  Bloc.observer = AppBlocObserver();

  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) {
      loggerError(error.toString(), error, stack);
    },
  );
}
