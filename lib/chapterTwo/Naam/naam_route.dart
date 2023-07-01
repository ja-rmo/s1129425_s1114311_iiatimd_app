import 'package:flutter/material.dart';
import '../../widgets/video_player_widget.dart';

class NaamPage extends StatefulWidget {
  const NaamPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NaamPageState createState() => _NaamPageState();
}

class _NaamPageState extends State<NaamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduceren'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Vandaag leren we je de zin "Mijn naam is {}"! Dit is hoe het er in zijn geheel uit ziet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(
                videoUrl: 'assets/videos/Mijn_naam_is_Suzette.mp4',
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/showcase_naam');
          },
          child: const Text('Ga verder'),
        ),
      ),
    );
  }
}
