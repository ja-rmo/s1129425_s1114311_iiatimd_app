import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/chapter_button.dart';
import 'camera_preview.dart';
import 'videopages/full_video_page.dart';
import 'chapter_navigation.dart';
import 'chapterOne/alphabet.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

        '/naam': (context) => const FullVideoPage(),
        // '/leeftijd': (context) => const ,
        // '/wonen': (context) => const ,
        // '/school': (context) => const ,
        '/camera': (context) => const CameraPreviewWidget(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final PageController pageController = PageController(viewportFraction: 0.8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dovenlingo'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: 100,
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
            ),
          ),
          SizedBox(
            height: 250,
            width: width,
            child: PageView(
              controller: pageController,
              children: [
                ChapterButton(
                  headline: "Hoofdstuk 1",
                  description: "Alfabet: A tot Z!",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk-1');
                  },
                ),
                ChapterButton(
                  headline: "Hoofdstuk 2",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk-2');
                  },
                ),
                ChapterButton(
                  headline: "Hoofdstuk 3",
                  description: "Coming Soon",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk-3');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
