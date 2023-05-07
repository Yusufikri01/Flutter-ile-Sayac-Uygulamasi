import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator_use/Pages/SetTimer.dart';

class HomePage extends StatefulWidget {
  int? toplam;
  HomePage(this.toplam, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  double _percent = 1.0;
  int _secondsRemaining = 0;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.toplam!;
  }

  void Start() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (_secondsRemaining == 0) {
          timer?.cancel();
        } else {
          _secondsRemaining--;
          _percent = _secondsRemaining / (widget.toplam!);
        }
      });
    });
    setState(() {
      _started = true;
    });
  }

  void Pause() {
    timer?.cancel();
    setState(() {
      _started = false;
    });
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                (_started) ? Pause() : Start();
              },
              child: Container(
                child: CircularPercentIndicator(
                    radius: 150.0,
                    lineWidth: 10.0,
                    animation: false,
                    percent: _percent,
                    center: Text(
                      _formatTime(_secondsRemaining),
                      style: TextStyle(color: Colors.white, fontSize: 53),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.amberAccent,
                    backgroundColor: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectTime(),
                      ),
                    );
                  },
                  child: Text(
                    "Set Timer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
