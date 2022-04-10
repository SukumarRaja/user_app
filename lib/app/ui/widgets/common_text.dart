//Packages
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {Key? key, this.text, this.size = 16.0, this.color = Colors.black, this.fontWeight})
      : super(key: key);
  final String? text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight),
    );
  }
}
