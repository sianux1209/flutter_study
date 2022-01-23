import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'app.dart';
import 'counter_observer.dart';

// Source : https://github.com/felangel/bloc/blob/master/docs/fluttercountertutorial.md

void main() {
  BlocOverrides.runZoned(
    () => runApp(const CounterApp()),
    blocObserver: CounterObserver(),
  );
}
