import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidgetCamera extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidgetCamera({Key? key, required this.videoPath})
      : super(key: key);

  @override
  State<VideoPlayerWidgetCamera> createState() =>
      _VideoPlayerWidgetCameraState();
}

class _VideoPlayerWidgetCameraState extends State<VideoPlayerWidgetCamera> {
  late VideoPlayerController _controller;
  late String _videoPath;

  @override
  void initState() {
    super.initState();
    _videoPath = widget.videoPath;
    _controller = VideoPlayerController.file(File(_videoPath));
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      await _controller.initialize();
      setState(() {});
    } catch (error) {
      // Handle error
      print('Error initializing video player: $error');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}
