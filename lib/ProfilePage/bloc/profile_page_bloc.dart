import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_page_event.dart';
part 'profile_page_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc(ProfilePageState initialState) : super(initialState);

  @override
  Stream<ProfilePageState> mapEventToState(ProfilePageEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
