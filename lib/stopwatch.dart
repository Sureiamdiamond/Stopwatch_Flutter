import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/elapsed_time_text_basic.dart';
import 'package:stopwatch/reset_button.dart';
import 'package:stopwatch/start_stop_button.dart';
import 'package:stopwatch/stopwatchRendrer.dart';

import 'elapsed_time_text.dart';


class Stopwatch extends StatefulWidget {
  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with SingleTickerProviderStateMixin{
  Duration _preElapsed = Duration.zero;
  Duration _currElapsed = Duration.zero;

  late final Ticker _ticker;
  Duration get _separishodeh => _preElapsed + _currElapsed;
 bool isRunning = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currElapsed = elapsed;
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning(){
    setState(() {
      isRunning = !isRunning;
      if(isRunning){
        _ticker.start();
      }else{
        _ticker.stop();
        _preElapsed += _currElapsed;
        _currElapsed = Duration.zero;
      }
    });
  }

  void _reset(){
    _ticker.stop();
    setState(() {
      isRunning = false;
      _preElapsed = Duration.zero;
      _currElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) { 
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopWatchRenderee(
              radius: radius,
                separishodeh: _separishodeh

            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ResetButton(
                    onPressed: _reset,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80,
                height: 80,
                child: StartStopButton(
                  onPressed:_toggleRunning,
                  isRunning: isRunning,
                ),
              ),
            )

          ],
        );
      },
    );
  }
}
