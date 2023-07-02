import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScorePage extends StatelessWidget {
  final String originalVideo;

  const ScorePage({
    Key? key,
    required this.originalVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomRating = random.nextInt(5) + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jouw Score'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Jouw Score is: $randomRating! Goed gedaan hoor!',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              randomRating,
              (index) => const Icon(Icons.star, color: Colors.yellow),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final currentContext = context;
              SharedPreferences.getInstance().then((prefs) {
                prefs.setInt(originalVideo, randomRating);
              });
              Navigator.popUntil(currentContext, ModalRoute.withName('/'));
            },
            child: const Text('Score opslaan en terug'),
          ),
        ],
      ),
    );
  }
}
