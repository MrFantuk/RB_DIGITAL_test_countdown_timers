import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timers_bloc.dart';
import 'package:flutter_timer/db/database.dart';
import 'package:flutter_timer/src/timer_add.dart';
import 'package:flutter_timer/widget/timer_tile.dart';
import 'package:provider/provider.dart';

class TimerList extends StatefulWidget {
  const TimerList({Key? key}) : super(key: key);

  @override
  State<TimerList> createState() => _TimerListState();
}

class _TimerListState extends State<TimerList> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<MyDatabase>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("TIMER LIST"),
        centerTitle: false,
       
      ),
      body: BlocBuilder<TimersBloc, TimersState>(
        builder: (context, state) {
          if (state is TimersLoaded) {
            final timers = state.timers;

            return Column(
              children: [
                Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                        itemCount: timers.length,
                        itemBuilder: (context, int index) {
                          return TimerTile(
                            key: UniqueKey(),
                            timerIndex: index,
                            timerData: timers[index],
                          );
                        })),
                SizedBox(
                  height: 100,
                  child: ListTile(
                    title: Text("TOTAL: ${timers.length}"),
                  ),
                )
              ],
            );
          }
          return Column(
            children: const [
              Spacer(),
              SizedBox(
                height: 100,
                child: ListTile(
                  title: Text("TOTAL: 0"),
                ),
              )
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTimerScreen())),
        child: const Icon(Icons.add),
      ), //
    );
  }
}
