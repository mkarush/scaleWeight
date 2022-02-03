import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.textStyle, required this.text})
      : super(key: key);

  final String text;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle);
  }
}
