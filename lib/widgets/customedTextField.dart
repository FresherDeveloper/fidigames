import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CustomedTextField extends StatelessWidget {
  final String text;

  CustomedTextField({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(13, 8, 13, 16),
        filled: true,
        fillColor: const Color(0xff292333),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: text,
        hintStyle: getRegularStyle(fontSize: 14),
      ),
      style: getRegularStyle(fontSize: 14),
    );
  }
}
// const TextStyle(
//           color: Color.fromARGB(255, 170, 170, 170),
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//         ),