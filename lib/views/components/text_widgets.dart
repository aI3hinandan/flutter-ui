import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final double size;
  final TextAlign alignment;
  const DescriptionText({
    Key key, this.text = "", this.size = 18, this.alignment = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.grey),
      textAlign: alignment,
    );
  }
}