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
  
  State<ShowcasePage> createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduceren'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                widget.introductionText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: VideoPlayerWidget(
                videoUrl: widget.videoUrl,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Text(
                'Houd er rekening mee dat het gespiegeld is. Als het in de video naar rechts gaat, doe jij het naar links!',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
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
