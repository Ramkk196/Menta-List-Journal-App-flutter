import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(

        apiKey: "AIzaSyASnQjb6cJk2Z4SL_2l_yddklaJu-VdWEs",
        appId: "1:198120308835:android:b2d6841e4c92ecfd03f856",
        messagingSenderId: "198120308835",
        projectId: "app27-dcddd",
      ));

      runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentalist',
      theme: ThemeData(
        primaryColor: Colors.orange[900],
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
