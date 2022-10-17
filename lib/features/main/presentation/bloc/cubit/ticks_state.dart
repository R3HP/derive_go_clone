part of 'ticks_cubit.dart';

@immutable
abstract class TicksState {}

class TicksInitial extends TicksState {}


class TicksLoading extends TicksState{}

class TicksLoaded extends TicksState {
  final List<Tick> tickList;

  TicksLoaded({
    required this.tickList,
  });

}

class TickError extends TicksState {
  final String errorMessage;
  
  TickError({
    required this.errorMessage,
  });
}
