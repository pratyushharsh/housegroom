import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc() : super(InitialListingState());

  ListingState get currentState => null;

  @override
  Stream<ListingState> mapEventToState(
    ListingEvent event,
  ) async* {
    if (event is Names) {
      yield NewListingState.fromOldListingState(currentState,
          names: event.payload);
    } else if (event is Icons) {
      yield NewListingState.fromOldListingState(currentState,
          icons: event.payload);
    }
  }
}
