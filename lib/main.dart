// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/Chat/chatPage.dart';
import 'package:flutter_application_1/view/LandingPage/landingPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Staket',
      options: FirebaseOptions(
          // apiKey: "",
          // appId: "",
          // messagingSenderId: "",
          // projectId: "",

          apiKey: "AIzaSyAUfOnsqcBU2pXJLM8-f34FT3Ou6j851Qw",
          // authDomain: "staket-f7278.firebaseapp.com",
          projectId: "staket-f7278",
          //storageBucket: "staket-f7278.appspot.com",
          messagingSenderId: "1090593060777",
          appId: "1:1090593060777:web:fbde6129b3456c978e36b8",
          measurementId: "G-DF8RN05QNH"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Staket_MFC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Staket_MFC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingScreen(),
    );
  }
}
