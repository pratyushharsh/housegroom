part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class ChangeTagEvent extends HomeEvent {
  final String tag;
  ChangeTagEvent({this.tag});
}
