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
      padding: const EdgeInsets.fromLTRB(20,0,20,20),
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
          visualDensity: VisualDensity.adaptivePlatformDensity,
          tapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: const Duration(milliseconds: 100),
          enableFeedback: true,
        ), 
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(headline),
            Text(description),
            const Text("Ga naar dit hoofdstuk"),
          ],
        ),
      ),
    );
  }
}
