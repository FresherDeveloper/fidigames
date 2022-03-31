import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xffFEFEFE),
        fontFamily: "poppins",
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20,
      ),
    );
  }
}
