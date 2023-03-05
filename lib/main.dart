import 'dart:math';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

final linesRef = FirebaseFirestore.instance.collection('lines');
int i = Random().nextInt(100);

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "PickUp",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              //child: Padding(
              // padding: EdgeInsets.all(8.0),
              child: Card(
                child: Center(
                  child: FutureBuilder<Object>(
                      future: linesRef.get(),
                      builder: (context, future) {
                        // return a random line from the collection of lines or a loading indicator
                        if (future.hasData) {
                          final lines = (future.data as QuerySnapshot).docs;
                          final randomLine = lines[i % lines.length];
                          return Text(
                            randomLine['line'],
                            // 'This is a test line',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 34,
                              color: Colors.black,
                            ),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ),
              ),
            ),

            // Row of tinder like dislike buttons here
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 55,
                        ),
                        onTap: () {
                          print('Dislike');
                          setState(() {
                            i++;
                            print(i);
                          });
                          // (context as Element).reassemble();
                          //should refresh state with new pickup line
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 55,
                          // color: Colors.green,
                        ),
                        onTap: () {
                          //should refresh state with new pickup line
                          print('Like');
                          setState(() {
                            i++;
                            print(i);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
