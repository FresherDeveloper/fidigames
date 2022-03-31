import 'package:fidigames/screens/addGame.dart';
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
          )),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontFamily: "poppins",
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
