part of 'listing_bloc.dart';

abstract class ListingState extends Equatable {
  final String names;
  final star;

  ListingState({this.star, this.names});

  @override
  List<Object> get props => [];
}

class InitialListingState extends ListingState {
  InitialListingState() : super(names: 'Laxmi', star: true);
}

class NewListingState extends ListingState {
  NewListingState.fromOldListingState(ListingState oldState,
      {String names, Widget star})
      : super(names: names ?? oldState.names, star: star ?? oldState.star);
}
