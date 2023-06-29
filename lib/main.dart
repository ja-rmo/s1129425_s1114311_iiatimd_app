import 'package:flutter/material.dart';

import 'video_player_widget.dart';
import 'camera_preview.dart';

Future<void> main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
  } catch (e) {
    print(e);
  }
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

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Dovenlingo')),
//       body: ListView(
//         children: [
//           Container(
//               height: 300,
//               width: 200,
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(20),
//               child: const VideoPlayerWidget(videoUrl: 'assets/videos/cat-jam.mp4')),
//           Container(
//               height: 300,
//               width: 200,
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(20),
//               child: const VideoPlayerWidget(
//                   videoUrl: 'assets/videos/the-more-you-know.mp4')),
//         ],
//       ),
//     );
//   }
// }

