import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameCatogory extends StatefulWidget {
  final List<String> items;
  final Function(String) onDropDownValueCallback;

  GameCatogory({
    required this.items,
    required this.onDropDownValueCallback,
  });

  @override
  State<GameCatogory> createState() => _GameCatogoryState();
}

class _GameCatogoryState extends State<GameCatogory> {
   String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 135,
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 5),
      decoration: 
      BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: 
        Border.all(
          color: const Color(0xffBAB8BB),
        ),
      ),
      child: DropdownButton(
        value:selectedItem ,
          underline: Container(),
          style: getMediumStyle(fontColor: const Color(0xffFFFFFF)),
          dropdownColor: const Color(0xff292333),
          isExpanded: true,
          hint: Text(
            " categories",
            style: getMediumStyle(fontColor: const Color(0xffFFFFFF)),
          ),
          icon: SvgPicture.asset(
            "assets/icons/arrow_down2.svg",
          ),
          items: widget.items
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
          onChanged: (String? value) {
          setState(() {
            selectedItem=value ;
          });
            widget.onDropDownValueCallback(
              value.toString(),
            );
          },
           
          ),
      
          );
    
  }
}
