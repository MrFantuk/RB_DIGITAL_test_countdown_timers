import 'package:bloc/bloc.dart';
import 'package:flutter_timer/db/database.dart';
import 'package:flutter_timer/db/timer_table.dart';
import 'package:meta/meta.dart';

part 'timers_event.dart';
part 'timers_state.dart';

class TimersBloc extends Bloc<TimersEvent, TimersState> {
  final TimerDao _db;
  TimersBloc(this._db) : super(TimersInitial()) {
    on<LoadTimers>(_onLoadTimers);
    on<UpdateTimers>(_onUpdateTimers);
    on<AddTimer>(_onAddTimer);
    on<DeleteTimer>(_onDeleteTimer);
  }

  void _onLoadTimers(LoadTimers event, Emitter<TimersState> emit) {
    _db.streamAllTimers().listen((timers) => add(UpdateTimers(timers)));
  }

  void _onUpdateTimers(UpdateTimers event, Emitter<TimersState> emit) {
    emit(TimersLoaded(event.timers));
  }

  void _onAddTimer(AddTimer event, Emitter<TimersState> emit) async {
   await _db.createTimer(event.timer);
  }

  void _onDeleteTimer(DeleteTimer event, Emitter<TimersState> emit) async {
   await _db.deleteTimer(event.timer);

  }
}
