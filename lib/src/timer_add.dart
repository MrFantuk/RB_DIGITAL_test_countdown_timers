import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timers_bloc.dart';
import 'package:flutter_timer/db/database.dart';

class NewTimerScreen extends StatelessWidget {
  const NewTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timerBloc = BlocProvider.of<TimersBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("NEW TIMER"), centerTitle: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Random random = Random();
                        final int randomNumber = random.nextInt(20);
                        
                        timerBloc.add(AddTimer(
                            TimerData(id: null, duration: randomNumber)));
                      },
                      child: const Text("Start Random Timer")),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
