import 'package:flutter/material.dart';

// ignore: camel_case_types
class subjectButton extends StatelessWidget {
  const subjectButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        style: ButtonStyle(
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
            const Size(80, 80),
          ),
          alignment: Alignment.center,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          tapTargetSize: MaterialTapTargetSize.padded,
          animationDuration: const Duration(milliseconds: 100),
          enableFeedback: true,
        ),
        onPressed: () => Navigator.pushNamed(context, onPressed),
        child: Text(text),
      ),
    );
  }
}
