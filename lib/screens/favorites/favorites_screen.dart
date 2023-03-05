import 'package:flutter/material.dart';

import 'package:hack_tj_23/screens/lines/lines_screen.dart';
import 'package:hack_tj_23/screens/favorites/favorites_line_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favoriteLines;
  const FavoritesScreen({super.key, required this.favoriteLines});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favorites",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              //navigate home
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LinesScreen(),
                ),
              );
            }
          ),
        ]
      ),
      // Scrollable list of favorite lines
      body: ListView.builder(
          // reverse: true,
          itemCount: favoriteLines.length,
          itemBuilder: (context, index) {
            return FavoritesLineCard(lineID: favoriteLines[favoriteLines.length - index - 1]);
          },
        ),
    );
  }
}