import 'package:flutter/material.dart';
import 'videopages/video_player_widget.dart';

class VideoPlaybackPage extends StatelessWidget {
  final String videoPath;


  const VideoPlaybackPage({Key? key, required this.videoPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Playback'),
      ),
      body: Center(
        child: VideoPlayerWidget(videoUrl: videoPath),
      ),
    );
  }
}
