import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  final String hintText;
  const HintText({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: const TextStyle(
        color: Color(0xffFEFEFE),
        fontFamily: "poppins",
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }
}
