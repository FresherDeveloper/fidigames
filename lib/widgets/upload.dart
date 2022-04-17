import 'package:fidigames/widgets/hintText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.fromLTRB(13, 8, 13, 16),
      decoration: BoxDecoration(
        color: const Color(0xff292333),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/upload.svg",height: 14,width: 14,fit: BoxFit.cover,
            ),
          ),
          const HintText(
            hintText: "Upload an image",
          ),
        ],
      ),
    );
  }
}
