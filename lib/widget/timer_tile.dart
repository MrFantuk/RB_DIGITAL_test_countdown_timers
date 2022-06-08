import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/bloc/timers_bloc.dart';
import 'package:flutter_timer/db/database.dart';

class TimerTile extends StatefulWidget {
  final int timerIndex;
  final TimerData timerData;

  const TimerTile({
    Key? key,
    required this.timerIndex,
    required this.timerData,
  }) : super(key: key);

  @override
  State<TimerTile> createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  final CustomTimerController _controller = CustomTimerController();

  @override
  void initState() {
    if (widget.timerIndex < 4 &&
        _controller.state != CustomTimerState.counting) {
      _controller.start();
    } else {
      _controller.pause();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Timer ${widget.timerData.id!}"),
      subtitle: Text("Duration: ${widget.timerData.duration}"),
      trailing: SizedBox(
        width: 100,
        height: 80,
        child: CustomTimer(
            controller: _controller,
            begin: Duration(seconds: widget.timerData.duration),
            end: const Duration(),
            builder: (time) {
              return Center(child: Text("${time.minutes}:${time.seconds}", style: const TextStyle(fontSize: 17.0)));
            },
            stateBuilder: (time, state) {
              // This builder is shown when the state is different from "couting".
              if (state == CustomTimerState.paused) {
                if (widget.timerIndex < 4) {
                  _controller.start();
                }
                return const Center(child:  Text("paused", style: const TextStyle(fontSize: 17.0)));
              }

              // If null is returned, "builder" is displayed.
              return null;
            },
            onChangeState: (state) {
              if (state == CustomTimerState.finished || widget.timerData.duration == 0) {
           
                _deleteTimer(context, widget.timerData);
              }
            }),
      ),
    );
  }

  void _deleteTimer(context, TimerData timerData) {
    final timerBloc = BlocProvider.of<TimersBloc>(context, listen: false);
    timerBloc.add(DeleteTimer(timerData));
  }
}
