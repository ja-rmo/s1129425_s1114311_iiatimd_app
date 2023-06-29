import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'chapter.dart';
import 'chapter_navigation.dart';
import 'full_video_page.dart';
import 'alfabet_A-E_video_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dovenlingo',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/hoofdstuk1_navigatie': (context) => const ChapterNavigation(),
        // '/hoofdstuk2_navigatie': (context) => const ChapterNavigation(),
        // '/hoofdstuk3_navigatie': (context) => const ChapterNavigation(),
        '/alfabet': (context) => const AlfabetAEPage(),
        '/naam': (context) => const VideoPage(),
        // '/leeftijd': (context) => const ,
        // '/wonen': (context) => const ,
        // '/school': (context) => const ,
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  int? savedInteger;

  @override
  void initState() {
    super.initState();
    _loadInteger();
  }

  void _loadInteger() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      savedInteger = prefs.getInt('testyinteger');
    });
  }

  void _saveInteger(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('testyinteger', value);
    setState(() {
      savedInteger = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final PageController pageController = PageController(viewportFraction: 0.8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dovenlingo'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: 100,
            alignment: Alignment.center,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
            ),
          ),
          SizedBox(
            height: 250,
            width: width,
            child: PageView(
              controller: pageController,
              children: [
                Chapter(
                  headline: "Hoofdstuk 1",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk1_navigatie');
                  },
                ),
                Chapter(
                  headline: "Hoofdstuk 2",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk2_navigatie');
                  },
                ),
                Chapter(
                  headline: "Hoofdstuk 3",
                  description: "Introductie",
                  onPressed: () {
                    Navigator.pushNamed(context, '/hoofdstuk3_navigatie');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Opgeslagen waarde: ${savedInteger ?? "Nog geen waarde"}',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Voer een getal in',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              int? value = int.tryParse(_textFieldController.text);
              if (value != null) {
                _saveInteger(value);
              }
            },
            child: const Text('Opslaan'),
          ),
        ],
      ),
    );
  }
}
