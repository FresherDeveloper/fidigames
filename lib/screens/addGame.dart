import 'dart:ui';

import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/screens/gameList.dart';
import 'package:fidigames/widgets/common_widgets/appbar.dart';
import 'package:fidigames/widgets/common_widgets/space.dart';
import 'package:fidigames/widgets/customedElevatedButton.dart';
import 'package:fidigames/widgets/customedTextField.dart';
import 'package:fidigames/widgets/dropDownButton.dart';

import 'package:fidigames/widgets/upload.dart';
import 'package:flutter/material.dart';

import '../widgets/hintText.dart';

class AddGame extends StatelessWidget {
  const AddGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: getAppbar(onBackPress: (){},
            title: AppStrings.addAGame, automaticallyImplyLeading: true),
        backgroundColor: const Color(0xff1A121E),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 24,
              right: 21,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name of the Game",
                  style: getRegularStyle(),
                ),
                verticalSpace(5),
                CustomedTextField(text: "Enter Game Name"),
                verticalSpace(27),
                upperText(textFieldName: "Description"),
                verticalSpace(5),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 8, 70, 16),
                    filled: true,
                    fillColor: const Color(0xff292333),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText:
                        "Join your crewmates in a multiplayer game of teamwork.",
                    hintStyle: getRegularStyle(fontSize: 14),
                  ),
                ),
                verticalSpace(33),
                upperText(textFieldName: "Game Url"),
                verticalSpace(5),
                CustomedTextField(text: "www.amongus.com"),
                verticalSpace(46),
                upperText(textFieldName: "Players Count"),
                verticalSpace(5),
                playersCount(),
                verticalSpace(49),
                upperText(textFieldName: "Category"),
                verticalSpace(5),
                DropDownButton(),
                verticalSpace(41),
                Upload(),
                verticalSpace(37),
                Center(
                  child: CustomedElevatedButton(
                    buttonText: "Submit",
                    buttonAction: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GameList()));
                    },
                  ),
                ),
                verticalSpace(27),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget upperText({required String textFieldName}) {
    return Text(
      textFieldName,
      style: getRegularStyle(),
    );
  }

  Widget playersCount() {
    return Wrap(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HintText(hintText: "Minimum Count"),
            horizontalSpace(5),
            countContainer(count: 2),
          ],
        ),

        horizontalSpace(29),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HintText(hintText: "Maximum count"),
            horizontalSpace(5),
            countContainer(count: 8),
          ],
        ),

      ],
    );
  }

  Widget countContainer({required int count}) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
        color: const Color(0xff292333),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "$count",
          style: getRegularStyle(fontSize: 14),
        ),
      ),
    );
  }
}
