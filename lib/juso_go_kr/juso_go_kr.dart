// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class JusoGoKr extends StatelessWidget {
  const JusoGoKr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JusoGoKr',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JusoStateful(),
    );
  }
}

class JusoStateful extends StatefulWidget {
  const JusoStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => JusoState();
}

class JusoState extends State<JusoStateful> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("주소검색기"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: TextField(controller: controller),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('text : ${controller.text}');
                  },
                  child: Text("주소 검색",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
            Flexible(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => Row(
                  children: [
                    Text('[01234]'),
                    Flexible(
                        child: Text(
                            '서울특별시 강남구 자곡동 11111111111111111 11111111111111')),
                  ],
                ),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
