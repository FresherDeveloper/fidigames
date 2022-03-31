import 'package:fidigames/widgets/hintText.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String? valueChoose;

  List items = ["Among Us", "Mini Militia", "Skribbl.io"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 369,
      // height: 48,
      padding: const EdgeInsets.fromLTRB(13, 8, 13, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xff292333),
      ),
      child: DropdownButton(
        underline: Container(),
        dropdownColor: const Color(0xff292333),
        hint: const HintText(hintText: "Choose the category of game"),
        isExpanded: true,
        icon: const SizedBox(
          height: 6,
          width: 12,
          child: Icon(
            Icons.arrow_drop_down_outlined,
            color: Color(0xffFEFEFE),
          ),
        ),
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue as String;
          });
        },
        items: items.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(
              valueItem,
              style: TextStyle(
                color: Color(0xffFEFEFE),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
