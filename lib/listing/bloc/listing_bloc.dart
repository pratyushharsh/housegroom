import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc(ListingState initialState)
      : super(ListingState(tag: '  ', map: HashMap()));

  @override
  Stream<ListingState> mapEventToState(ListingEvent event) async* {
    //if else
  }
}
