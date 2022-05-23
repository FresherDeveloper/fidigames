import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class GameDropDownButton extends StatefulWidget {

  final Function(String) onDropDownValueCallback;
  final double height;
  final double width;
  final double borderWidth;
  final BorderRadiusGeometry borderRadius;
  final Color borderColor;
  final Color fillColor;
  final Widget hintText;
  final Widget icon;
    final bool errorOccured;

  GameDropDownButton({
    Key? key,
   
    required this.onDropDownValueCallback,
    required this.height,
    required this.width,
    this.borderWidth = 1.0,
    required this.borderRadius,
    required this.borderColor,
    required this.fillColor,
    required this.hintText,
    required this.icon,
    this.errorOccured = false,
  }) : super(key: key);

  @override
  State<GameDropDownButton> createState() => _GameDropDownButtonState();
}

class _GameDropDownButtonState extends State<GameDropDownButton> {
  String? selectedItem;
 
  var items=[
    "Among Us",
    "Mini Militia",
    "Skribbl.io",
    "Call of Duty",
    "among us",
    "FPS",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
      decoration: BoxDecoration(
        color: widget.fillColor,
        borderRadius: widget.borderRadius,
        
        border: Border.all(
          width: widget.borderWidth,
          color: widget.errorOccured==true? Colors.red.shade900 :widget.borderColor,
          
        ),
      ),
      child: DropdownButton(
        value: selectedItem,
        underline: Container(),
        style: getMediumStyle(fontColor: const Color(0xffFFFFFF)),
        dropdownColor: const Color(0xff292333),
        isExpanded: true,
        hint: widget.hintText,
        icon: widget.icon,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: getRegularStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (String? value,) {
          setState(() {
            selectedItem = value;
          
          });
          widget.onDropDownValueCallback(
            value.toString(),
            
          );
          
        },
      ),
    );
  }
}
