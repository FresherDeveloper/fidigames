import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function() buttonAction;
  CustomElevatedButton(
      {Key? key, required this.buttonText, required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      child: Text(
        buttonText,
        style:
            getSemiBoldStyle(fontSize: 14, fontColor: const Color(0xff000000)),
      ),
    );
  }
}
