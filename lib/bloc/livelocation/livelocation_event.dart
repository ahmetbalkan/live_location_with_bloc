part of 'livelocation_bloc.dart';

abstract class LivelocationEvent extends Equatable {
  const LivelocationEvent();

  @override
  List<Object> get props => [];
}

class LoadLocationEvent extends LivelocationEvent {}

class UpdateLocationEvent extends LivelocationEvent {
  final LocationData position;
  const UpdateLocationEvent({required this.position});
  @override
  List<Object> get props => [position];
}
