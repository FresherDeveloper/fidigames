import 'dart:io';

import 'package:fidigames/widgets/hinttext.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Upload extends StatefulWidget {
  Function(String) onSelectImage;
  final bool erroroccured;


  Upload({
    required this.onSelectImage, this.erroroccured = false,
  });

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? image;

  Future pickImage() async {
    try {
      File? file;

      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        file = File(result.files.single.path!);
      } else {}

      print('Selected Image Path is ${file!.path}');

      widget.onSelectImage(file.path);
      setState(
        () {
          this.image = file;

        },
      );
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return image != null
        ? Center(
            child:  Image.file(
            image!,
            width: 150,
            height: 150,
          ))
        :
         Container(
              height: 48,
              padding: const EdgeInsets.fromLTRB(13, 8, 13, 16),
              decoration: BoxDecoration(
                color: const Color(0xff292333),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.erroroccured?Colors.red:Colors.white70,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      pickImage();
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/upload.svg",
                      height: 14,
                      width: 14,
                      fit: BoxFit.cover,
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
