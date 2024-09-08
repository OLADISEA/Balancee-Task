import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  const AppText({
    super.key,
    required this.text,
    this.color = Colors.black, required this.fontSize, this.textAlign, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign??TextAlign.start,
      style: TextStyle(
          fontFamily: 'Poppins',
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight?? FontWeight.normal
      ),
    );
  }
}
