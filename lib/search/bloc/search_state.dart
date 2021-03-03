part of 'search_bloc.dart';

@immutable
class SearchState extends Equatable {
  final String tag;
  final String serviceType;
  final String gender;
  final String age;
  final String experience;

  SearchState(
      {this.tag, this.serviceType, this.gender, this.age, this.experience});

  SearchState copyWith(
      {String tag,
      String serviceType,
      String gender,
      String age,
      String experience}) {
    return SearchState(
        age: age ?? this.age,
        experience: experience ?? this.experience,
        gender: gender ?? this.gender,
        serviceType: serviceType ?? this.serviceType,
        tag: serviceType ?? this.tag);
  }

  List<Object> get props => [tag, serviceType, gender, age, experience];
}
