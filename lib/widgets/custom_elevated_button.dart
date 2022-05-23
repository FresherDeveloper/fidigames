import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final Function() buttonAction;
  final Widget? icon;
  CustomElevatedButton(
      {Key? key, required this.buttonText, required this.buttonAction, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: buttonAction,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: icon??const SizedBox(),
          ),
          Text(
            buttonText,
            style:
                getSemiBoldStyle(fontSize: 14, fontColor: const Color(0xff000000)),
          ),
        ],
      ),
    );
  }
}
