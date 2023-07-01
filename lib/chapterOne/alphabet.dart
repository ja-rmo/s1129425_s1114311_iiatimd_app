import 'package:flutter/material.dart';
import 'package:flutter_dovenlingo/widgets/video_player_widget.dart';

class AlphabetPage extends StatelessWidget {
  final List<String> letters;

  const AlphabetPage({Key? key, required this.letters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Het Alfabet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Hier leer je het alfabet! We beginnen met ${letters.first} tot en met ${letters.last}!"',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Center(
              child: VideoPlayerWidget(
                  videoUrl:
                      'assets/videos/Alfabet_${letters.first}-${letters.last}.mp4'),
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


// Widget alphabetAEPage(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Het Alfabet'),
//     ),
//     body: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Hier leer je het alfabet! we beginnen met A tot en met E!"',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: _isVideoInitialized
//                 ? Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       AspectRatio(
//                         aspectRatio: _controller.value.aspectRatio,
//                         child: VideoPlayer(_controller),
//                       ),
//                       Positioned(
//                         bottom: 16,
//                         right: 16,
//                         child: FloatingActionButton(
//                           onPressed: () {
//                             setState(() {
//                               _isPlaying = !_isPlaying;
//                               if (_isPlaying) {
//                                 _controller.play();
//                               } else {
//                                 _controller.pause();
//                               }
//                             });
//                           },
//                           child: Icon(
//                             _isPlaying ? Icons.pause : Icons.play_arrow,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : const CircularProgressIndicator(),
//           ),
//         ),
//       ],
//     ),
//     floatingActionButton: Container(
//       width: double.infinity,
//       margin: const EdgeInsets.all(16.0),
//       child: ElevatedButton.icon(
//         onPressed: () {},
//         icon: const Icon(Icons.camera),
//         label: const Text('Maak video'),
//       ),
//     ),
//     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//   );
// }
