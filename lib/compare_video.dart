import 'package:flutter/material.dart';
import 'videopages/video_player_widget.dart';

class VideoPlaybackPage extends StatelessWidget {
  const VideoPlaybackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoUrl = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Playback'),
      ),
      body: Center(
        child: VideoPlayerWidget(videoUrl: videoUrl),
      ),
    );
  }
}
