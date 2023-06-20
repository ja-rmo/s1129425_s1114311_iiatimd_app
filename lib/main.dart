import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final List<Widget> _pages = [
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.red),
  ];
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dovenlingo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: DotsIndicator(
              dotsCount: _pages.length,
              position: _currentPage.toInt(),
              decorator: DotsDecorator(
                color: Colors.green[100]!,
                activeColor: Colors.green[900],
                size: const Size.fromRadius(10),
                activeSize: const Size(15, 35),
                activeShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: 360.0,
              height: 360.0,
              child: PageView(
                controller: _pageController,
                children: _pages,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
