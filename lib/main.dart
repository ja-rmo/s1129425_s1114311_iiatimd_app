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
      home: const HomePage(),
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
      body: const CameraPreviewWidget(),
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

