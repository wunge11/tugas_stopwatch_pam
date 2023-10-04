import 'dart:async';
import 'package:flutter/material.dart';

String formatTime(int milliseconds) {
  var msec = (milliseconds % 100).toString().padLeft(2, '0');
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');

  return "$hours:$minutes:$seconds:$msec";
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  List<String> lapTimes = [];

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }

    setState(() {});
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    lapTimes.clear();
    setState(() {});
  }

  void _recordLapTime() {
    if (_stopwatch.isRunning) {
      lapTimes.add(formatTime(_stopwatch.elapsedMilliseconds));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Stopwatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _handleStartStop,
                  child: Icon(
                    _stopwatch.isRunning ? Icons.stop : Icons.play_arrow,
                  ),
                  backgroundColor: _stopwatch.isRunning ? Colors.red : Colors.blueGrey,
                ),
                SizedBox(width: 20.0),
                FloatingActionButton(
                  onPressed: _recordLapTime,
                  child: Icon(Icons.timelapse),
                ),
                SizedBox(width: 20.0),
                FloatingActionButton(
                  onPressed: _resetStopwatch,
                  child: Icon(Icons.refresh),
                  backgroundColor: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: lapTimes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      'Lap ${index + 1}:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      lapTimes[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
