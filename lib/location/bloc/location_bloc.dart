import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationState initialState) : super(initialState);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {}
}
