// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';

class FlutterDrawer extends StatelessWidget {
  const FlutterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlutterDrawerSF(),
    );
  }
}

class FlutterDrawerSF extends StatefulWidget {
  const FlutterDrawerSF({Key? key}) : super(key: key);

  @override
  _FlutterDrawerSFState createState() => _FlutterDrawerSFState();
}

class _FlutterDrawerSFState extends State<FlutterDrawerSF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Drawer')),
      body: Column(
        children: <Widget>[
          Text("Test"),
          Text("Test"),
        ],
      ),
    );
  }
}
