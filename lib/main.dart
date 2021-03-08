import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housegroom/bloc_observer.dart';
import 'package:housegroom/listing/bloc/listing_bloc.dart';
import 'home.dart';

void main() {
  final BlocProvider<ListingBloc> blocProvider = BlocProvider<ListingBloc>(
    create: (_) => ListingBloc(),
    child: AppView(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = HouseGroomBlockObserver();
  runApp(blocProvider);
}
