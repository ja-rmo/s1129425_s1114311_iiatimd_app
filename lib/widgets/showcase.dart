import 'package:flutter/material.dart';
import '../widgets/video_player_widget.dart';
import 'camera_preview.dart';

class ShowcasePage extends StatefulWidget {
  final String introductionText;
  final String videoUrl;

  const ShowcasePage({
    Key? key,
    required this.introductionText,
    required this.videoUrl,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ShowcasePageState createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduceren'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.introductionText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(
                videoUrl: widget.videoUrl,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraPreviewWidget(
                originalVideo: widget.videoUrl,
              ),
            ),
          ),
          icon: const Icon(Icons.camera),
          label: const Text('Maak video'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
