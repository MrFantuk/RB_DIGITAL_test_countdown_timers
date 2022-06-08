part of 'timers_bloc.dart';

@immutable
abstract class TimersEvent {
  const TimersEvent();

  @override
  List<Object> get props => [];
}

class LoadTimers extends TimersEvent {}

class UpdateTimers extends TimersEvent {
  final List<TimerData> timers;

  const UpdateTimers(this.timers);
}

class AddTimer extends TimersEvent {
  final TimerData timer;

  const AddTimer(this.timer);
}

class DeleteTimer extends TimersEvent {
  final TimerData timer;

  const DeleteTimer(this.timer);
}
