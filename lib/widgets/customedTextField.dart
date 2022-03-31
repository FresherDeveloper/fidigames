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
        hintStyle: const TextStyle(
          color: Color(0xffFEFEFE),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      ),
    );
  }
}
