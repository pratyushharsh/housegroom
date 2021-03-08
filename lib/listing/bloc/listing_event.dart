part of 'listing_bloc.dart';

abstract class ListingEvent extends Equatable {
  final dynamic payload;
  ListingEvent(this.payload);

  @override
  List<Object> get props => [Names, Rating, ForwardButton];
}

class Names extends ListingEvent {
  Names(payload) : super(payload);
}

class Rating extends ListingEvent {
  Rating(payload) : super(payload);
}

class ForwardButton extends ListingEvent {
  ForwardButton(payload) : super(payload);
}
