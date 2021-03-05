part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final String tag;
  final Map<String, String> map;

  SearchState(
      {this.tag, this.map});

  SearchState copyWith(
      {String tag,
        Map<String, String> map,
      }) {
    return SearchState(
        map: map ?? this.map,
        tag: tag ?? this.tag);
  }

  List<Object> get props => [tag, map];
}
