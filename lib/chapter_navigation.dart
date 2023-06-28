import 'package:flutter/material.dart';

class ChapterNavigation extends StatelessWidget {
  const ChapterNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoofdstuk 1'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            _buildButton(context, 'Alfabet', '/alfabet'),
            _buildButton(context, 'Naam', '/naam'),
            _buildButton(context, 'Leeftijd', '/leeftijd'),
            _buildButton(context, 'Wonen', '/wonen'),
            _buildButton(context, 'School', '/school'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
      BuildContext context, String buttonText, String routeName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(buttonText),
      ),
    );
  }
}
