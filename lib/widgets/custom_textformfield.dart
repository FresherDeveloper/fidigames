import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomTextFormField({Key? key, required this.text, this.controller, this.validator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
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
