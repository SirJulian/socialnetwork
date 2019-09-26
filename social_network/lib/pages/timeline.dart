import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';
import 'package:fluttershare/widgets/progress.dart';

final usersRef = Firestore.instance.collection("users");

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    getUsers();
    super.initState();
  }

  // getUserById() async {
  //   final DocumentSnapshot doc =
  //       await usersRef.document("ZGwKpJy9fRXXCjO3qLMr").get();

  //   print(doc.data["username"]);
  // }
  getUsers() async {
    final QuerySnapshot snapshot = await usersRef
        .limit(1)
        .orderBy("postsCount", descending: true)
        .getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc) {
      print(doc.data);
      print(doc.documentID);
      print(doc.exists);
    });

    // usersRef.getDocuments().then((QuerySnapshot snapshot) {
    //
    // });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: linearProgress(),
    );
  }
}
