import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

final linesRef = FirebaseFirestore.instance.collection('lines');

class FavoritesLineCard extends StatelessWidget {
  final String lineID;
  const FavoritesLineCard({super.key, required this.lineID});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 8.0,
        margin: const EdgeInsets.all(16.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: FutureBuilder<Object>(
                future: linesRef.doc(lineID).get(),
                builder: (context, snapshot) {
                  return snapshot.hasData ? Text(
                    (snapshot.data as DocumentSnapshot).get('line'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ) : const Center(child: CircularProgressIndicator());
                }
              ),
            ),
          ),
        ),
      );
  }
}