import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CustomedElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function() buttonAction;
  CustomedElevatedButton(
      {Key? key, required this.buttonText, required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 48),
        primary: const Color(0xffFCBC3C),
        onPrimary: const Color(0xff000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        buttonText,
        style:
            getSemiBoldStyle(fontSize: 14, fontColor: const Color(0xff000000)),
      ),
    );
  }
}
