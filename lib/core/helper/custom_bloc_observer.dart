import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      //print a comment to make my knowledge easier
      log ('Transition ========================');
      // log('${bloc.runtimeType} $transition');
    }
  }

  //on create
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log('Create ========================');
      // log('${bloc.runtimeType} created');
    }
  }
  //on event
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      log('Event ========================');
      // log('${bloc.runtimeType} $event');
    }
  }

  //on change
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      log('Change ========================');
      // log('${bloc.runtimeType} $change');
    }
  }
  //on error
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      log('Error ========================');
      log('${bloc.runtimeType} $error');
    }
  }
}
