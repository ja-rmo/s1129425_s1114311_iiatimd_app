import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BlockWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
