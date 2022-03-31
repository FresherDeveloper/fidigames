import 'dart:ui';

import 'package:fidigames/screens/gameList.dart';
import 'package:fidigames/widgets/customedElevatedButton.dart';
import 'package:fidigames/widgets/customedTextField.dart';
import 'package:fidigames/widgets/dropDownButton.dart';
import 'package:fidigames/widgets/titleText.dart';
import 'package:fidigames/widgets/upload.dart';
import 'package:flutter/material.dart';

import '../widgets/hintText.dart';

class AddGame extends StatelessWidget {
  const AddGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget sizedBox = const SizedBox(
      height: 5,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1A121E),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              //top: 33,
              left: 24,
              right: 21,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    const SizedBox(
                      width: 15.5,
                    ),
                    const TitleText(title: "Add a Game"),
                  ],
                ),
                const SizedBox(
                  height: 29,
                ),
                upperText(textFieldName: "Name of the Game"),
                sizedBox,
                CustomedTextField(text: "Among us"),
                const SizedBox(
                  height: 27,
                ),
                upperText(textFieldName: "Description"),
                sizedBox,
                TextField(
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff292333),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText:
                        "Join your crewmates in a multiplayer game of teamwork.",
                    hintStyle: const TextStyle(
                      color: Color(0xffFEFEFE),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 33,
                ),
                upperText(textFieldName: "Game Url"),
                sizedBox,
                CustomedTextField(text: "www.amongus.com"),
                const SizedBox(
                  height: 46,
                ),
                upperText(textFieldName: "Players Count"),
                sizedBox,
                playersCount(),
                const SizedBox(
                  height: 49,
                ),
                upperText(textFieldName: "Category"),
                sizedBox,
                DropDownButton(),
                const SizedBox(
                  height: 41,
                ),
                const SizedBox(
                  width: 15.54,
                ),
                Upload(),
                const SizedBox(
                  height: 37,
                ),
                Center(
                  child: CustomedElevatedButton(
                    buttonText: "Submit",
                    buttonAction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GameList()));
                    },
                  ),
                ),
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
      style: const TextStyle(
        color: Color(0xffFEFEFE),
        fontFamily: "poppins",
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
    );
  }

  Widget playersCount() {
    return Row(
      children: [
        const HintText(hintText: "Minimum Count"),
        const SizedBox(
          width: 3,
        ),
        countContainer(count: 2),
        const SizedBox(width: 29),
        const HintText(hintText: "Maximum count"),
        countContainer(count: 8),
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
          style: const TextStyle(
            color: Color(0xffFEFEFE),
            fontFamily: "poppins",
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
