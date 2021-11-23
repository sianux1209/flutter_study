// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FortuneCookie extends StatelessWidget {
  const FortuneCookie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FortuneCookie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FortuneCookieStateful(),
    );
  }
}

class FortuneCookieStateful extends StatefulWidget {
  const FortuneCookieStateful({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FortuneCookieState();
}

class FortuneCookieState extends State<FortuneCookieStateful> {
  var url = 'https://freesvg.org/img/fortune-cookie.png';
  var messages = [
    '기다리던 일이 오늘 이루어질 것입니다.',
    '건강에 유의하고 외출을 삼가세요',
    '발 밑을 조심하세요!',
    '금전운이 있을 날입니다'
  ];

  shuffle() {
    setState(() {
      messages.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  children: [
                    GestureDetector(
                      onTap: shuffle,
                      child: Image.network(url),
                      ),
                      Text(messages[0], 
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                  ]
                )
        )
    );
  }
}