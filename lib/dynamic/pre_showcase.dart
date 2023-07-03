import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'showcase.dart';

class PreShowcasePage extends StatelessWidget {
  final String introductionText;
  final String videoUrl;

  const PreShowcasePage({
    Key? key,
    required this.introductionText,
    required this.videoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jouw vorige score'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<int?>(
              future: _fetchScore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final score = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        'Score voor deze cursus is: $score',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          score,
                          (index) =>
                              const Icon(Icons.star, color: Colors.yellow),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text(
                    'Je hebt deze cursus nog niet gevolgd, ga snel verder om een nieuwe high score te plaatsen!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowcasePage(
                    videoUrl: videoUrl,
                    introductionText: introductionText,
                  ),
                ),
              );
            },
            child: const Text('Verder'),
          ),
        ],
      ),
    );
  }

  Future<int?> _fetchScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? score = prefs.getInt(videoUrl);
    return score;
  }
}
