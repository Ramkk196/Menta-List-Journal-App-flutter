import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/addnote.dart';
import 'login.dart';
import 'message.dart';
import 'chatpage.dart';

class addnote extends StatelessWidget {
  TextEditingController title = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final fs = FirebaseFirestore.instance;
    CollectionReference ref = FirebaseFirestore.instance.collection('user');

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todos"),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller:  title,
                decoration: InputDecoration(
                  hintText: 'title',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            /*MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                var asStream = ref
                    .push()
                    .set(
                  title.text,
                )
                    .asStream();

              },
              child: Text(
                "save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),*/
            MaterialButton(
              color: Colors.indigo[900],
              onPressed: () {
                ref.add({
                  'title': title.text,
                  // Add other fields as needed
                }).then((_) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Data saved successfully!'),
                    ),
                  );
                }).catchError((error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $error'),
                    ),
                  );
                });
              },
              child: Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          elevation: 5.0,
          height: 40,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => chatpage(email: '',),
              ),
            );
          },
          color: Colors.blue[900],
          child: Text(
            "Go back to Journal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
            IconButton(
              onPressed: () {
                if (title.text.isNotEmpty) {
                  fs.collection('Messages').doc().set({
                    'message': title.text.trim(),
                    'time': DateTime.now(),

                  });

                  title.clear();
                }
              },
              icon: Icon(Icons.send_sharp),
            ),
          ],
        ),
      ),
    );
  }
}

