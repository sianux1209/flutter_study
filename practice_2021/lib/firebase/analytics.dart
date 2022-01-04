import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class FlutterfireAnalytics extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  const FlutterfireAnalytics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analytics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: AnalyticsSF(analytics, observer),
    );
  }
}

class AnalyticsSF extends StatefulWidget {
  FirebaseAnalytics analytics;
  FirebaseAnalyticsObserver observer;

  AnalyticsSF(this.analytics, this.observer, {Key? key}) : super(key: key);

  @override
  _AnalyticsSFState createState() => _AnalyticsSFState(analytics, observer);
}

class _AnalyticsSFState extends State<AnalyticsSF> {
  FirebaseAnalytics analytics;
  FirebaseAnalyticsObserver observer;
  String resultMessage = 'None';

  _AnalyticsSFState(this.analytics, this.observer);

  Future<void> eventA() async {
    await analytics.logEvent(
      name: 'test_event_A',
      parameters: {'type': 'A'},
    );
    setState(() {
      resultMessage = 'Event A logged.';
    });
  }

  Future<void> eventB() async {
    await analytics.logEvent(
      name: 'test_event_B',
      parameters: {'type': 'B'},
    );
    setState(() {
      resultMessage = 'Event B logged.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Analytics'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  eventA();
                },
                child: Text('Test A'),
              ),
              ElevatedButton(
                onPressed: () {
                  eventB();
                },
                child: Text('Test B'),
              ),
              Text('$resultMessage'),
            ],
          ),
        ));
  }
}
