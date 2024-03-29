import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/widgets/hintText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDownButton extends StatelessWidget {
  final List items = ["Among Us", "Mini Militia", "Skribbl.io"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        dropdownColor: const Color(0xff292333),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(16, 13, 19, 13),
          filled: true,
          fillColor: const Color(0xff292333),
        ),
        isExpanded: true,
        hint: const HintText(hintText: "Choose the category of game"),
        icon: SvgPicture.asset(
          "assets/icons/arrow_down1.svg",
        ),
        items: items
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: getRegularStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) {
          print(value);
        });
  }
}
