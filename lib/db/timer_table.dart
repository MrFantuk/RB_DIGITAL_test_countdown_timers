import 'package:drift/drift.dart';

import 'database.dart';

part 'timer_table.g.dart';

class Timer extends Table {
  IntColumn? get id => integer().autoIncrement().nullable()();
  IntColumn? get duration => integer()();
}

@DriftAccessor(tables: [Timer])
class TimerDao extends DatabaseAccessor<MyDatabase> with _$TimerDaoMixin {
  TimerDao(MyDatabase db) : super(db);

  Stream<List<TimerData>> streamAllTimers() {
    return (select(timer)
          ..orderBy([
            ((t) => OrderingTerm(expression: t.id, mode: OrderingMode.asc))
          ]))
        .watch();
  }

  Future createTimer(Insertable<TimerData> timerData) =>
      into(timer).insert(timerData);
  Future deleteTimer(Insertable<TimerData> timerData) =>
      delete(timer).delete(timerData);

  Future deleteAllTimers() => delete(timer).go();
}
