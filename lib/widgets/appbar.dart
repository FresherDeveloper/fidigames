import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar getAppbar(
    {String title = '',
    bool automaticallyImplyLeading = false,
    void Function()? onBackPress}) {
  return AppBar(titleSpacing: onBackPress == null?24: 0,

    leading: onBackPress != null
        ? IconButton(
          iconSize: 24,
             padding: const EdgeInsets.all(0),
            icon: SvgPicture.asset(
              "assets/icons/arrow_left.svg",
              fit: BoxFit.contain,
              height: 16,
              width: 9,
            ),
            onPressed: onBackPress,
          )
        : null,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Text(
      title,
      style: getSemiBoldStyle(fontSize: 20),
    ),
  );
}
