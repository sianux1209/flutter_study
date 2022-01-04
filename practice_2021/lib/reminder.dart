// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  const ReminderStateful({Key? key}) : super(key: key);

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
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: list.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == list.length) {
            return Column(
              children: [
                TextField(controller: textFieldController),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      list.add(textFieldController.text);
                      storage.setItem('reminder', jsonEncode(list));
                    });
                  },
                  child: Text("추가"),
                ),
              ],
            );
          }
          return Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        list.removeAt(index);
                        storage.setItem('reminder', jsonEncode(list));
                      });
                    },
                    child: Icon(
                      Icons.check,
                    ),
                  ),
                ),
                Text(list[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}


 // children: [

            //   Text(list.toString()),
            //   TextField(controller: textFieldController),
            //   ElevatedButton(
            //       onPressed: () {
            //         setState(() {
            //           list.add(textFieldController.text);
            //           dev.log(textFieldController.text, name: "todo log");
            //           dev.log(jsonEncode(list), name: " Add onpressed");
            //         });
            //       },
            //       child: Text("추가")),
            //   ElevatedButton(
            //       onPressed: () {
            //         setState(() {
            //           list.clear();
            //           list.add('init');
            //           dev.log(jsonEncode(list), name: " Clear onpressed");
            //         });
            //       },
            //       child: Text("초기화"))
            // ],