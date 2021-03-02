import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/bloc_observer.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = HouseGroomBlockObserver();
  runApp(AppView());
}

