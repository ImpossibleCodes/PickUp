import 'dart:math';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:hack_tj_23/screens/lines/lines_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PickUp',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LinesScreen(key: key),
    );
  }
}
