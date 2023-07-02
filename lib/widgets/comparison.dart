import 'package:flutter/material.dart';
import 'camera_preview.dart';
import 'score.dart';
import 'video_player_widget.dart';

class ComparisonPage extends StatelessWidget {
  final String videoFilePath;
  final String originalVideo;

  const ComparisonPage({
    Key? key,
    required this.videoFilePath,
    required this.originalVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparison Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hier kan je de verschillen zoeken!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(
                videoUrl: videoFilePath,
                isAsset: false,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(
                videoUrl: originalVideo,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraPreviewWidget(
                      originalVideo: originalVideo,
                    ),
                  ),
                );
              },
              child: const Text('Opnieuw proberen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScorePage(
                      originalVideo: originalVideo,
                    ),
                  ),
                );
              },
              child: const Text('Zie je Score!'),
            ),
          ],
        ),
      ),
    );
  }
}
