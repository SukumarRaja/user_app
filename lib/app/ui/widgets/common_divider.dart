//Packages
import 'package:flutter/material.dart';

class CommonDivider extends StatelessWidget {
  const CommonDivider(
      {Key? key,
      this.height = 5,
      this.width = 120,
      this.color ,
      this.borderRadius = 10})
      : super(key: key);
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius!),
          color: Colors.purpleAccent.withAlpha(30)
          ),
    );
  }
}
