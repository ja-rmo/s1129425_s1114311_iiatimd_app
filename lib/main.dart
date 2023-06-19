import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "hello world",
      textDirection: TextDirection.ltr,
    ));
  }
}
