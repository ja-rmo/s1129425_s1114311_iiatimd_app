import 'package:flutter/material.dart';

import 'video_player_widget.dart';
import 'chapter.dart';
import 'chapter_navigation.dart';
import 'alfabet_A-E_video_page.dart';
import 'block_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '';


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
        '/hoofdstuk1_navigatie': (context) => const ChapterNavigation(),
        // '/hoofdstuk2_navigatie': (context) => const ChapterNavigation(),
        // '/hoofdstuk3_navigatie': (context) => const ChapterNavigation(),
        '/alfabet': (context) => const AlfabetAEPage(),
        '/naam': (context) => const VideoPlayerWidget(videoUrl: 'assets/videos/alfabet/naam.mp4'),
        // '/leeftijd': (context) => const ,
        // '/wonen': (context) => const ,
        // '/school': (context) => const ,
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
                Chapter(
                  headline: "Hoofdstuk 1",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk1_navigatie');
                  },
                ),
                Chapter(
                  headline: "Hoofdstuk 2",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk2_navigatie');
                  },
                ),
                Chapter(
                  headline: "Hoofdstuk 3",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk3_navigatie');
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
