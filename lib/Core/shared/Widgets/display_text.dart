import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  const DisplayText(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.textAlign,
      this.textOverflow,
      this.fontWeight = FontWeight.w400,
      this.color,
      this.style = const TextStyle(fontSize: 15)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
          color: color, fontWeight: fontWeight, fontSize: style.fontSize?.sp),
      textAlign: textAlign,
      overflow: textOverflow,
    );
  }
}
