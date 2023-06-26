import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dovenlingo/camera_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_media_info/flutter_media_info.dart';
import 'chapter.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dovenlingo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CameraPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  final double width = window.physicalSize.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dovenlingo'),
        ),
        body: Column(children: [
          Container(
              height: 40,
              width: 100,
              alignment: Alignment.center,
              child:
                  SmoothPageIndicator(controller: _pageController, count: 3)),
          SizedBox(
            height: 250,
            width: width,
            child: PageView(controller: _pageController, children: [
              Chapter(
                  headline: "hoofdstuk 1",
                  description: "introductie",
                  onPressed: () => Navigator.pushNamed(context, '/hoofdstuk1')),
              Chapter(
                  headline: "hoofdstuk 2",
                  description: "introductie",
                  onPressed: () => Navigator.pushNamed(context, '/hoofdstuk2')),
              Chapter(
                  headline: "hoofdstuk 3",
                  description: "introductie",
                  onPressed: () => Navigator.pushNamed(context, '/hoofdstuk3'))
            ]),
          ),
        ]));
  }
}

void main() {
  runApp(const MainApp());
}
