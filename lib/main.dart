import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/chapter_button.dart';
import 'widgets/pre_showcase.dart';

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

        '/alfabetAE': (context) => const PreShowcasePage(
              introductionText:
                  'Hier leer je het alfabet! We beginnen met A tot en met E!',
              videoUrl: 'assets/videos/Alfabet_A-E.mp4',
            ),
        '/alfabetFJ': (context) => const PreShowcasePage(
              introductionText:
                  'Hier leer je het alfabet! We beginnen met F tot en met J!',
              videoUrl: 'assets/videos/Alfabet_F-J.mp4',
            ),
        '/alfabetKO': (context) => const PreShowcasePage(
              introductionText:
                  'Hier leer je het alfabet! We beginnen met K tot en met O!',
              videoUrl: 'assets/videos/Alfabet_K-O.mp4',
            ),
        '/alfabetPT': (context) => const PreShowcasePage(
              introductionText:
                  'Hier leer je het alfabet! We beginnen met P tot en met T!',
              videoUrl: 'assets/videos/Alfabet_P-T.mp4',
            ),
        '/alfabetUZ': (context) => const PreShowcasePage(
              introductionText:
                  'Hier leer je het alfabet! We beginnen met U tot en met Z!',
              videoUrl: 'assets/videos/Alfabet_U-Z.mp4',
            ),
        '/naam': (context) => const PreShowcasePage(
              introductionText:
                  'In deze cursus leren we je de zin "Mijn naam is {}"! Dit is hoe het er in zijn geheel uit ziet',
              videoUrl: 'assets/videos/Mijn_naam_is_Suzette.mp4',
            ),
        '/hoeGaatHet': (context) => const PreShowcasePage(
              introductionText:
                  'In deze cursus leren we je de zin "Hoe gaat het"! Dit is hoe het er in zijn geheel uit ziet',
              videoUrl: 'assets/videos/Hoe_gaat_het.mp4',
            ),
        '/hoeIsHet': (context) => const PreShowcasePage(
              introductionText:
                  'In deze cursus leren we je de zin "Hoe is het"! Dit is hoe het er in zijn geheel uit ziet',
              videoUrl: 'assets/videos/Hoe_is_het.mp4',
            ),
        // '/leeftijd': (context) => const ,
        // '/wonen': (context) => const ,
        // '/school': (context) => const ,
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
