import 'package:flutter/material.dart';
import 'video_player_widget.dart';
import 'video_player_widget_camera.dart';

class ComparisonPage extends StatelessWidget {
  final String videoFilePath;
  final String originalVideo;

  const ComparisonPage(
      {Key? key, required this.videoFilePath, required this.originalVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: VideoPlayerWidgetCamera(videoUrl: videoFilePath),
          ),
          Expanded(
            child: VideoPlayerWidget(videoUrl: originalVideo),
          ),
        ],
      ),
    );
  }
}
