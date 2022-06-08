import 'package:flutter/material.dart';
import 'package:flutter_timer/bloc/timers_bloc.dart';
import 'package:flutter_timer/db/database.dart';
import 'package:flutter_timer/src/timer_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widget/ticker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Provider<MyDatabase>(
      create: (context) => MyDatabase(),
      child: const MyApp(),
      dispose: (context, db) => db.close(),
    ),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    //      const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TimersBloc(db.timerDao)..add(LoadTimers()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const TimerList(),
      ),
    );
  }
}
