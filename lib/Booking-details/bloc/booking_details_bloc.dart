import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';

part 'booking_details_event.dart';
part 'booking_details_state.dart';

class BookingDetailsBloc extends Bloc<BookingDetailsEvent, BookingDetailState> {
  BookingDetailsBloc(BookingDetailState initialState) : super(initialState);

  @override
  Stream<BookingDetailState> mapEventToState(BookingDetailsEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
