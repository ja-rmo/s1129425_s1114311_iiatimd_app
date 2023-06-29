import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AlfabetAEPage extends StatefulWidget {
  const AlfabetAEPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AlfabetAEPageState createState() => _AlfabetAEPageState();
}

class _AlfabetAEPageState extends State<AlfabetAEPage> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/Alfabet_A-E.mp4')
      ..initialize().then((_) {
        setState(() {
          _isVideoInitialized = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Het Alfabet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hier leer je het alfabet! we beginnen met A tot en met E!"',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: _isVideoInitialized
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _isPlaying = !_isPlaying;
                                if (_isPlaying) {
                                  _controller.play();
                                } else {
                                  _controller.pause();
                                }
                              });
                            },
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.camera),
          label: const Text('Maak video'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}