import 'package:fidigames/widgets/hintText.dart';
import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 369,
      decoration: BoxDecoration(
        color: const Color(0xff292333),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.drive_folder_upload_outlined,
              color: Color(0xffFEFEFE),
            ),
          ),
          const HintText(hintText: "Upload an image"),
        ],
      ),
    );
  }
}
