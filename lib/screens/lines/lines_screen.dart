import 'dart:math';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hack_tj_23/screens/favorites/favorites_screen.dart';
import 'package:hack_tj_23/screens/lines/lines_widget.dart';

final linesRef = FirebaseFirestore.instance.collection('lines');
List<String> favoriteLines = [];
String currentLineId = '';
int i = Random().nextInt(100);

class LinesScreen extends StatefulWidget {
  const LinesScreen({super.key});

  @override
  State<LinesScreen> createState() => _LinesScreenState();
}

class _LinesScreenState extends State<LinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "PickUp",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteLines: favoriteLines),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Object>(
              future: linesRef.get(),
              builder: (context, future) {
                // return a random line from the collection of lines or a loading indicator
                if (future.hasData) {
                  final lines = (future.data as QuerySnapshot).docs;
                  final randomLine = lines[i % lines.length];
                  currentLineId = randomLine.id;
                  return LinesCard(
                    text: randomLine['line'],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Center(
                      child: InkWell(
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 60,
                        ),
                        onTap: () {
                          print('Dislike');
                          setState(() {
                            i++;
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
                          size: 60,
                        ),
                        onTap: () {
                          print('Like');
                          setState(() {
                            i++;
                            favoriteLines.add(currentLineId);
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
      ),
    );
  }
}
