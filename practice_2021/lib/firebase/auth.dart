// ignore_for_file: unnecessary_string_interpolations

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class FlutterfireAuth extends StatelessWidget {
  const FlutterfireAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authencation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthSF(),
    );
  }
}

class AuthSF extends StatefulWidget {
  AuthSF({Key? key}) : super(key: key);

  @override
  AuthSFState createState() => AuthSFState();
}

class AuthSFState extends State<AuthSF> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String signMessage = '';

  Future<void> register() async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    var user = result.user;
    log('user : $user');

    setState(() {
      signMessage = '${emailController.text} account created';
    });
  }

  Future<void> signin() async {
    try {
      final result = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      setState(() {
        signMessage = '${emailController.text} login success';
      });

      log('result : $result');
    } catch (error) {
      setState(() {
        signMessage = 'check account info';
      });
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      log('result: ${result.user!.email}');

      setState(() {
        signMessage = 'Google login success';
      });
    } catch (error) {
      setState(() {
        signMessage = 'check account info';
      });
    }
  }

  Future<void> sigininWithAnonymous() async {
    try {
      final result = await auth.signInAnonymously();
      log('result: $result');
      setState(() {
        signMessage = 'Anonymous login success';
      });
    } catch (error) {
      setState(() {
        signMessage = 'check account info';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: signin, child: const Text('Email Login')),
                ElevatedButton(
                    onPressed: signinWithGoogle,
                    child: const Text('Google Login')),
                ElevatedButton(
                    onPressed: sigininWithAnonymous,
                    child: const Text('Anonymous Login')),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  register();
                },
                child: const Text('Sign-Up')),
            Text('$signMessage'),
          ],
        ),
      ),
    );
  }
}
