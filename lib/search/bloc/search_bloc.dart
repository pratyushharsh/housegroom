import 'dart:async';
import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState(tag: '  ', map: HashMap()));

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is ChangeTagEvent) {
      yield state.copyWith(tag: event.tag);
    } else if (event is ChangeCategoryValue) {
      HashMap<String, String> new_map = HashMap.from(state.map);
      if (new_map.containsKey(event.tag)) {
        new_map.update(event.tag, (value) => event.value);
      } else {
        new_map.putIfAbsent(event.tag, () => event.value);
      }
      yield state.copyWith(map: new_map);
    }
  }
}
