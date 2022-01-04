import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FiresotreFlutter extends StatelessWidget {
  const FiresotreFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirestoreFlutterSF(),
    );
  }
}

class FirestoreFlutterSF extends StatefulWidget {
  FirestoreFlutterSF({Key? key}) : super(key: key);

  @override
  FirestoreFlutterSFState createState() => FirestoreFlutterSFState();
}

class FirestoreFlutterSFState extends State<FirestoreFlutterSF> {
  Stream<QuerySnapshot> snapshot =
      FirebaseFirestore.instance.collection('Messages').snapshots();

  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FireStorte")),
      body: Column(
        children: [
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: snapshot,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                final QuerySnapshot querySnapshot = snapshot.data!;
                return ListView.builder(
                  itemCount: querySnapshot.size,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${querySnapshot.docs[index]['content']}'),
                    );
                  },
                );
              },
            ),
          ),
          Column(
            children: <Widget>[
              TextFormField(
                controller: messageController,
                decoration: InputDecoration(labelText: 'Message'),
              ),
              ElevatedButton(
                child: const Text('Send Message'),
                onPressed: () {
                  FirebaseFirestore.instance.collection('Messages').add({
                    'content': messageController.text,
                    'created_at': DateTime.now().microsecondsSinceEpoch
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
