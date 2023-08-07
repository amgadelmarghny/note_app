import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimbleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change = $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('Event = $event');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('close = $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('create = $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
  
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
