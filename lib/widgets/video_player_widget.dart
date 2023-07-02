import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool isAsset;

  const VideoPlayerWidget({
    Key? key,
    required this.videoUrl,
    this.isAsset = true,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isVideoEnd = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.isAsset
        ? VideoPlayerController.asset(widget.videoUrl)
        : VideoPlayerController.file(File(widget.videoUrl));
    _initializeVideoPlayerFuture = _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    await _controller.initialize();
    _controller.addListener(_videoPlayerListener);
    setState(() {});
  }

  void _videoPlayerListener() {
    if (_controller.value.position >= _controller.value.duration) {
      setState(() {
        _isVideoEnd = true;
      });
    } else {
      setState(() {
        _isVideoEnd = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoPlayerListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_isVideoEnd) {
                      _controller.seekTo(Duration.zero);
                      _isVideoEnd = false;
                    }
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _isVideoEnd || !_controller.value.isPlaying
                      ? Icons.play_arrow
                      : Icons.pause,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
