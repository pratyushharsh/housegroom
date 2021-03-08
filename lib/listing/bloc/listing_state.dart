part of 'listing_bloc.dart';

@immutable
class ListingState extends Equatable {
  final String tag;
  final Map<String, String> map;

  ListingState({this.tag, this.map});

  ListingState copyWith({
    String tag,
    Map<String, String> map,
  }) {
    return ListingState(map: map ?? this.map, tag: tag ?? this.tag);
  }

  List<Object> get props => [tag, map];
}
