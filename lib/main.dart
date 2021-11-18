import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:intl/intl.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClockFace(),
    );
  }
}

class ClockFace extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ClockFaceState();

}

class ClockFaceState extends State<ClockFace>{

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