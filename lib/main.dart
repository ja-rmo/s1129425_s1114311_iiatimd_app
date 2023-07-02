import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'compare_video.dart';
import 'widgets/chapter_button.dart';
import 'camera_preview.dart';
import 'chapter_navigation.dart';
import 'chapterOne/alphabet.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dovenlingo',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/hoofdstuk-1': (context) => //Dit is het hoofdstuk van het Alfabet
            const ChapterNavigation().chapter1(context),
        '/hoofdstuk-2':
            (context) => //Dit is het hoofdstuk waar je je gaat voorstellen
                const ChapterNavigation().chapter2(context),
        // '/hoofdstuk-3': (context) => //Dit hoofdstuk is Coming Soon (not)
        //     const ChapterNavigation().chapter3(context),

        //De middelste letters zoals B-C-D zijn eigenlijk niet nodig, maar voor het overzicht
        '/alfabetAE': (context) =>
            const AlphabetPage(letters: ['A', 'B', 'C', 'D', 'E']),
        '/alfabetFJ': (context) =>
            const AlphabetPage(letters: ['F', 'G', 'H', 'I', 'J']),
        '/alfabetKO': (context) =>
            const AlphabetPage(letters: ['K', 'L', 'M', 'N', 'O']),
        '/alfabetPT': (context) =>
            const AlphabetPage(letters: ['P', 'Q', 'R', 'S', 'T']),
        '/alfabetUZ': (context) =>
            const AlphabetPage(letters: ['U', 'V', 'W', 'X', 'Y', 'Z']),

        // '/naam': (context) => const FullVideoPage(),
        // '/leeftijd': (context) => const ,
        // '/wonen': (context) => const ,
        // '/school': (context) => const ,
        '/camera': (context) => const CameraPreviewWidget(),
        '/videoPlayback': (context) => const VideoPlaybackPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dovenlingo')),
      body: ListView(
        children: [
          Container(
              height: 300,
              width: 200,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: const VideoPlayerWidget(videoUrl: 'assets/videos/cat-jam.mp4')),
          Container(
              height: 300,
              width: 200,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: const VideoPlayerWidget(
                  videoUrl: 'assets/videos/the-more-you-know.mp4')),
        ],
      ),
    );
  }
}
