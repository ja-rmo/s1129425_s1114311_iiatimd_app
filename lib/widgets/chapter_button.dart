import 'package:flutter/material.dart';

class ChapterButton extends StatelessWidget {
  final String headline;
  final String description;
  final VoidCallback onPressed;

  const ChapterButton({
    Key? key,
    required this.headline,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
            shadowColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
            elevation: MaterialStateProperty.all<double>(10),
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(20),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(100, 100),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            tapTargetSize: MaterialTapTargetSize.padded,
            animationDuration: const Duration(milliseconds: 100),
            enableFeedback: true,
          ),
          onPressed: onPressed,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(headline),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(description),
              ),
              const Text("Ga naar dit hoofdstuk"),
            ],
          )),
    );
  }
}
