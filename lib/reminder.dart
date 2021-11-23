// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

/*
  Incompleted project.
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'dart:developer' as dev;

class Reminder extends StatelessWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReminderStateful(),
    );
  }
}

class ReminderStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReminderState();
}

class ReminderState extends State<ReminderStateful> {
  LocalStorage storage = LocalStorage('todo-List');
  var list = [];
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dev.log('Init state', name: 'todo log');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('할 일 목록')),
        body: Column(
          children: [
            TextField(controller: textFieldController),
            ElevatedButton(
                onPressed: () {

                  list.add(textFieldController.text);
                  dev.log(textFieldController.text, name: "todo log");
                  dev.log(jsonEncode(list), name: " Add onpressed");
                },
                child: Text("추가")
            ),
            ElevatedButton(
              onPressed: (){
                list.clear();
                dev.log(jsonEncode(list), name: " Clear onpressed");
              },
              child : Text("초기화")
            )
          ],
        )
    );
  }
}

