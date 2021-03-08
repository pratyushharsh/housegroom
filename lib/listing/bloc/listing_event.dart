part of 'listing_bloc.dart';

@immutable
abstract class ListingEvent {}

class ChangeTagEvent extends ListingEvent {
  final String tag;
  ChangeTagEvent({this.tag});
}

class ChangeNameEvent extends ListingEvent {
  final String tag;
  final String name;
  ChangeNameEvent({this.tag, this.name});
}

class ChangeImageEvent extends ListingEvent {
  final String tag;
  final Image image;
  ChangeImageEvent({this.tag, this.image});
}

class ChangeRatingEvent extends ListingEvent {
  final String tag;
  final Icon icon;
  ChangeRatingEvent({this.tag, this.icon});
}
