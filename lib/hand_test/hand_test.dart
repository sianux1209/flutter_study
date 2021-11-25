// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HandTest extends StatelessWidget {
  const HandTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HandTest',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HandList(),
          '/results/1': (context) => ResultA(),
          '/results/2': (context) => ResultB(),
          '/results/3': (context) => ResultC(),
          '/results/4': (context) => ResultD(),
        });
  }
}

class HandList extends StatelessWidget {
  var assets = [
    Image.asset('lib/hand_test/assets/hand-a.png'),
    Image.asset('lib/hand_test/assets/hand-c.png'),
    Image.asset('lib/hand_test/assets/hand-b.png'),
    Image.asset('lib/hand_test/assets/hand-d.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('손으로 하는 심리테스트')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: assets.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/results/${index + 1}');
            },
            child: assets[index],
          );
        },
      ),

      // body: GridView.count(
      //   mainAxisSpacing: 30,
      //   crossAxisSpacing: 60,
      //   crossAxisCount: 2,
      //   children: [
      //     Image.asset('lib/assets/hand-a.png'),
      //     Image.asset('lib/assets/hand-b.png'),
      //     Image.asset('lib/assets/hand-c.png'),
      //     Image.asset('lib/assets/hand-d.png'),
      //   ],
      // )

      // body: Column(
      //   children: <Widget>[
      //     Row(
      //       children: <Widget>[
      //         Image.asset('lib/assets/hand-a.png', width: 150, height: 150),
      //         Image.asset('lib/assets/hand-b.png', width: 150, height: 150),
      //       ],
      //     ),
      //     Row(
      //       children: <Widget>[
      //         Image.asset('lib/assets/hand-c.png', width: 150, height: 150),
      //         Image.asset('lib/assets/hand-d.png', width: 150, height: 150),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

class ResultA extends StatelessWidget {
  const ResultA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결과 A")),
      body: Column(
        children: [
          Text('아주 좋아요'),
        ],
      ),
    );
  }
}

class ResultB extends StatelessWidget {
  const ResultB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결과 A")),
      body: Column(
        children: [
          Text('좋아요'),
        ],
      ),
    );
  }
}

class ResultC extends StatelessWidget {
  const ResultC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결과 A")),
      body: Column(
        children: [
          Text('안좋아요'),
        ],
      ),
    );
  }
}

class ResultD extends StatelessWidget {
  const ResultD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("결과 A")),
      body: Column(
        children: [
          Text('아주 안좋아요'),
        ],
      ),
    );
  }
}
