part of 'timers_bloc.dart';

@immutable
abstract class TimersState {
  const TimersState();

  List<Object> get props => [];
}

class TimersInitial extends TimersState {}

class TimersLoaded extends TimersState {
  final List<TimerData> timers;

  const TimersLoaded(this.timers);

  @override
  List<Object> get props => [TimersLoaded];
}
