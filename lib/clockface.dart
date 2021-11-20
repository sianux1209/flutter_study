import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:intl/intl.dart';

/*
    Project name : clockface
    Explanation : stopwatch
 */

class ClockFace extends StatelessWidget {
  const ClockFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClockFaceStateful(),
    );
  }
}

class ClockFaceStateful extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ClockFaceStatefulState();

}

class ClockFaceStatefulState extends State<ClockFaceStateful>{

  DateFormat formatter = DateFormat('HH:mm:ss');
  var now = DateTime.now();

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        this.now = DateTime.now(); // why didn't work without 'this'..?
      });
    });

    dev.log(formatter.format(now), name: "logtype:debug");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(formatter.format(now), style: TextStyle(fontSize:64))
      ),
    );
  }
}