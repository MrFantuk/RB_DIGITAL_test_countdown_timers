// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TimerData extends DataClass implements Insertable<TimerData> {
  final int? id;
  final int duration;
  TimerData({this.id, required this.duration});
  factory TimerData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TimerData(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      duration: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}duration'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['duration'] = Variable<int>(duration);
    return map;
  }

  TimerCompanion toCompanion(bool nullToAbsent) {
    return TimerCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      duration: Value(duration),
    );
  }

  factory TimerData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimerData(
      id: serializer.fromJson<int?>(json['id']),
      duration: serializer.fromJson<int>(json['duration']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'duration': serializer.toJson<int>(duration),
    };
  }

  TimerData copyWith({int? id, int? duration}) => TimerData(
        id: id ?? this.id,
        duration: duration ?? this.duration,
      );
  @override
  String toString() {
    return (StringBuffer('TimerData(')
          ..write('id: $id, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, duration);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimerData &&
          other.id == this.id &&
          other.duration == this.duration);
}

class TimerCompanion extends UpdateCompanion<TimerData> {
  final Value<int?> id;
  final Value<int> duration;
  const TimerCompanion({
    this.id = const Value.absent(),
    this.duration = const Value.absent(),
  });
  TimerCompanion.insert({
    this.id = const Value.absent(),
    required int duration,
  }) : duration = Value(duration);
  static Insertable<TimerData> custom({
    Expression<int?>? id,
    Expression<int>? duration,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (duration != null) 'duration': duration,
    });
  }

  TimerCompanion copyWith({Value<int?>? id, Value<int>? duration}) {
    return TimerCompanion(
      id: id ?? this.id,
      duration: duration ?? this.duration,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimerCompanion(')
          ..write('id: $id, ')
          ..write('duration: $duration')
          ..write(')'))
        .toString();
  }
}

class $TimerTable extends Timer with TableInfo<$TimerTable, TimerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimerTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int?> duration = GeneratedColumn<int?>(
      'duration', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, duration];
  @override
  String get aliasedName => _alias ?? 'timer';
  @override
  String get actualTableName => 'timer';
  @override
  VerificationContext validateIntegrity(Insertable<TimerData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TimerData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TimerTable createAlias(String alias) {
    return $TimerTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TimerTable timer = $TimerTable(this);
  late final TimerDao timerDao = TimerDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timer];
}
