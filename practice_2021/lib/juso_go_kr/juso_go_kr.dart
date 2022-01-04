// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  List list = [];

  void search(String keyboard) async {
    final key = ''; // input your API Key
    var keyword = keyboard;
    String url = 'https://www.juso.go.kr/addrlink/addrLinkApi.do';

    // * Get 방식의 요청
    // final resultType = 'json';
    // var countPerPage = "100";
    // url +=
    //     '?confmKey=$key&resultType=$resultType&keyword=$keyword&countPerPage=$countPerPage';
    // var response = await http.get(Uri.parse(url));
    // var body = jsonDecode(response.body);

    // * Post 방식의 요청
    Map<String, String> params = {
      'confmKey': key,
      'keyword': keyword,
      'resultType': 'json',
      'countPerPage': '100'
    };
    var response = await http.post(Uri.parse(url), body: params, headers: {
      'content-type': 'application/x-www-form-urlencoded'
    }); // headers 생략 가능
    var body = jsonDecode(response.body);

    setState(() {
      list = body['results']['juso'];
    });
  }

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
                    search(controller.text);
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
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('[${list[index]['zipNo']}]'),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(list[index]['jibunAddr']),
                            Text(list[index]['roadAddr']),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: list.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
