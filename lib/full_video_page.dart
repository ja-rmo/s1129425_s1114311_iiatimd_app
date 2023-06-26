import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'mijn_video_page.dart';

class VideoPage extends StatefulWidget {
  final String filePath;

  const VideoPage({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _videoPlayerController;

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future _initVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(File(widget.filePath));
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    await _videoPlayerController.play();
  }

  @override
  Widget build(BuildContext context) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}