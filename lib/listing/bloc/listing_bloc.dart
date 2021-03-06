import 'package:flutter_bloc/flutter_bloc.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingBloc(ListingState initialState) : super(initialState);

  @override
  Stream<ListingState> mapEventToState(ListingEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
