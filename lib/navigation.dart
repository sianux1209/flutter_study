// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/detail': (context) => Detail(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈페이지"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail');

            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => Detail()),
            //); // navation to Detail page
          },
          child: Text('상세페이지로'),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('상세')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // pop this page
          },
          child: Text('돌아가기'),
        ),
      ),
    );
  }
}
