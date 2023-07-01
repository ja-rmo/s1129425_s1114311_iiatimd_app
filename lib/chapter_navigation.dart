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
          chapter3(context),
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
      body: Center(
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
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            subjectButton(text: 'Naam', onPressed: '/naam'),
            subjectButton(text: 'Leeftijd', onPressed: '/leeftijd'),
            subjectButton(text: 'Wonen', onPressed: '/wonen'),
            subjectButton(text: 'School', onPressed: '/school'),
          ],
        ),
      ),
    );
  }

  Widget chapter3(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoofdstuk 3'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: const [
            subjectButton(text: 'Alfabet', onPressed: '/alfabet'),
            subjectButton(text: 'Naam', onPressed: '/naam'),
            subjectButton(text: 'Leeftijd', onPressed: '/leeftijd'),
            subjectButton(text: 'Wonen', onPressed: '/wonen'),
            subjectButton(text: 'School', onPressed: '/school'),
          ],
        ),
      ),
    );
  }
}
