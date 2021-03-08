part of 'listing_bloc.dart';

abstract class ListingState extends Equatable {
  final String names;
  final Widget icons;

  ListingState({this.icons, this.names});

  @override
  List<Object> get props => [];
}

class InitialListingState extends ListingState {
  InitialListingState() : super(names: 'Laxmi', icons: Icon(Icons.star));
}

class NewListingState extends ListingState {
  NewListingState.fromOldListingState(ListingState oldState,
      {String names, Widget icons})
      : super(names: names ?? oldState.names, icons: icons ?? oldState.icons);
}
