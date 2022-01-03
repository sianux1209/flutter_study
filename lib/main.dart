// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study/boxoffice/boxoffice.dart';
import 'package:flutter_study/clock_face.dart';
import 'package:flutter_study/flutter_drawer.dart';
import 'package:flutter_study/fortune_cookie.dart';
import 'package:flutter_study/reminder.dart';
import 'package:flutter_study/navigation.dart';
import 'package:flutter_study/hand_test/hand_test.dart';
import 'package:flutter_study/juso_go_kr/juso_go_kr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_study/firebase/analytics.dart';
import 'package:flutter_study/firebase/auth.dart';
import 'package:flutter_study/firebase/firestore.dart';

/*
  [how to use?]
    >> choose the project and input runApp parameter of main function
    >> example runApp(ClockFace());

  [Project List]
    1. ClockFace()
    2. FortuneCookie()
    3. Reminder()
    4. Navigation()
    5. HandTest()
    6. JusoGoKr()  * Need your API key juso.go.kr
    7. Boxoffice() * Need your API key kobis.or.kr
    8. FlutterfireAnalytics()
    9. FlutterfireAuth()
    10. FiresotreFlutter()
    11. FlutterDrawer()
*/

void main() async {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); // if you use firebase enable this line
  // await Firebase.initializeApp(); // if you use firebase enable this line
  runApp(FlutterDrawer());
}
