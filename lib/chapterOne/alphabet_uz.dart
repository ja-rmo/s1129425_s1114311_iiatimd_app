import 'package:flutter/material.dart';
import 'package:flutter_dovenlingo/videopages/video_player_widget.dart';

class AlphabetUZ extends StatelessWidget {
  const AlphabetUZ({
    Key? key,
    
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Het Alfabet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Hier leer je het alfabet! we gaan verder met U tot en met Z!"',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(videoUrl: 'assets/videos/Alfabet_U-Z.mp4'),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16.0),
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pushNamed(context, '/camera'),
          icon: const Icon(Icons.camera),
          label: const Text('Maak video'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}