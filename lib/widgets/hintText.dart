import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class HintText extends StatelessWidget {
  final String hintText;
  const HintText({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: getRegularStyle(fontSize: 14),
    );
  }
}
