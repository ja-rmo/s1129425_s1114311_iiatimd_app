import 'package:flutter/material.dart';
import 'video_player_widget.dart';
import 'video_player_widget_camera.dart';

class ComparisonPage extends StatelessWidget {
  final String videoFilePath;

  const ComparisonPage({super.key, required this.videoFilePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Page'),
      ),
      body: Center(
        child: VideoPlayerWidgetCamera(videoPath: videoFilePath),
      ),
    );
  }
}
