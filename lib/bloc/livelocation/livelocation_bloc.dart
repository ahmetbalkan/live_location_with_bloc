import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'livelocation_event.dart';
part 'livelocation_state.dart';

class LivelocationBloc extends Bloc<LivelocationEvent, LivelocationState> {
  LivelocationBloc() : super(LivelocationLoading()) {
    on<LoadLocationEvent>((event, emit) {
      Location.instance.requestPermission();
      Location.instance
          .changeSettings(accuracy: LocationAccuracy.high, distanceFilter: 0);
      Location.instance.onLocationChanged.listen((event) {
        add(UpdateLocationEvent(position: event));
        print(event.latitude);
      });
    });

    on<UpdateLocationEvent>((event, emit) {
      emit(LivelocationLoaded(position: event.position));
    });
  }
}
