part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class ChangeTagEvent extends SearchEvent {
  final String tag;
  ChangeTagEvent(this.tag);
}

class ChangeCategoryValue extends SearchEvent {
  final String tag;
  final String value;

  ChangeCategoryValue(this.tag, this.value);
}

class ChangeServiceTypeEvent extends SearchEvent {
  final String tag;
  ChangeServiceTypeEvent(this.tag);
}

class ChangeSpecialityEvent extends SearchEvent {
  final String tag;
  ChangeSpecialityEvent(this.tag);
}

class ChangeGenderEvent extends SearchEvent {
  final String tag;
  ChangeGenderEvent(this.tag);
}

class ChangeAgeEvent extends SearchEvent {
  final String tag;
  ChangeAgeEvent(this.tag);
}