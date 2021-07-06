import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Center(
        child: Column(
         // mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
               // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LabelText(
                      label: 'HRS', value: hours.toString().padLeft(0, '0')),
                  LabelText(
                      label: 'MIN', value: minutes.toString().padLeft(1, '0')),
                  Expanded(
                    child: LabelText(
                        label: 'SEC', value: seconds.toString().padLeft(1, '0')),
                  ),
                ],
              ),
            ),
           // SizedBox(height: 60),
            Container(
              width: 200,
              height: 47,
              margin: EdgeInsets.only(bottom: 200),
             // margin: EdgeInsets.only(top: 30),
              child: RaisedButton(
                color: Colors.pink[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(isActive ? 'STOP' : 'START'),
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  LabelText({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.teal,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
