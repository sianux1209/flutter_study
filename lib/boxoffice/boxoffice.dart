// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Boxoffice extends StatelessWidget {
  const Boxoffice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoxOffice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BoxofficeSF(),
    );
  }
}

class BoxofficeSF extends StatefulWidget {
  const BoxofficeSF({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BoxofficeS();
}

class BoxofficeS extends State<BoxofficeSF> {
  String apiKey = 'eda4efb8e2489160524434831c195bd1';
  DateTime date = DateTime.now().subtract(Duration(days: 1));
  List list = [];
  DateFormat requestFormat = DateFormat('yyyyMMdd');
  DateFormat displayFormat = DateFormat('yyyy년 MM월 dd일');
  bool loaded = false;

  void load(DateTime date) async {
    setState(() {
      loaded = false;
      list = [];
    });

    var url =
        'https://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json';
    url += '?key=$apiKey';
    url += '&targetDt=${requestFormat.format(date)}';

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    setState(() {
      list = data['boxOfficeResult']['dailyBoxOfficeList'];
      loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    load(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("박스 오피스")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      date = date.subtract(Duration(days: 1));
                      load(date);
                    });
                  },
                  child: Text("이전"),
                ),
                Text(
                  displayFormat.format(date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      date = date.add(Duration(days: 1));
                      load(date);
                    });
                  },
                  child: Text("이후"),
                ),
              ],
            ),
          ),
          (loaded
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 200.0),
                  child: CircularProgressIndicator(),
                )),
          Flexible(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetail(list[index]['movieCd'], apiKey)),
                        );
                      },
                      child: Text(
                          '${list[index]['rnum']}위 ${list[index]['movieNm']}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MovieDetail extends StatefulWidget {
  String code;
  String apiKey;

  MovieDetail(this.code, this.apiKey, {Key? key});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  var movie;

  void load() async {
    String url =
        "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";
    url += '?key=${widget.apiKey}';
    url += '&movieCd=${widget.code}';

    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);
    setState(() {
      movie = data;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
        //LinearProgressIndicator(),
      ));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('영화 상세 정보'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('제목 : ${movie['movieInfoResult']['movieInfo']['movieNm']} '),
            Text('상영시간 : ${movie['movieInfoResult']['movieInfo']['showTm']}분 '),
            Flexible(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount:
                    movie['movieInfoResult']['movieInfo']['actors'].length,
                separatorBuilder: (BuildContext context, int index) =>
                    Text(' '),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Text("출연 :");
                  }
                  List actors = movie['movieInfoResult']['movieInfo']['actors'];
                  return (Text('${actors[index]['peopleNm']}'));
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
