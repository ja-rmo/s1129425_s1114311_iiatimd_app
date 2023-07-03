import 'package:flutter/material.dart';
import 'widgets/build_button.dart';

class ChapterNavigation extends StatelessWidget {
  const ChapterNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          chapter1(context),
          chapter2(context),
        ],
      ),
    );
  }

  Widget chapter1(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoofdstuk 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            subjectButton(text: 'Alfabet A tot E', onPressed: '/alfabetAE'),
            subjectButton(text: 'Alfabet F tot J', onPressed: '/alfabetFJ'),
            subjectButton(text: 'Alfabet K tot O', onPressed: '/alfabetKO'),
            subjectButton(text: 'Alfabet P tot T', onPressed: '/alfabetPT'),
            subjectButton(text: 'Alfabet U tot Z', onPressed: '/alfabetUZ'),
          ],
        ),
      ),
    );
  }

  Widget chapter2(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoofdstuk 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            subjectButton(text: 'Mijn naam is', onPressed: '/naam'),
            subjectButton(text: 'Hoe gaat het', onPressed: '/hoeGaatHet'),
            subjectButton(text: 'Hoe is het', onPressed: '/hoeIsHet'),
            subjectButton(text: 'Coming Soon', onPressed: '/school'),
          ],
        ),
      ),
    );
  }
}
