
import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/resources/values_manager.dart';
import 'package:fidigames/screens/gameList.dart';
import 'package:fidigames/widgets/appbar.dart';

import 'package:fidigames/widgets/customElevatedButton.dart';
import 'package:fidigames/widgets/customTextField.dart';
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
              top: AppPadding.p16,
              left: AppPadding.p24,
              right: AppPadding.p24,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                gameLabel(labelText:  "Name of the Game"),
                const SizedBox(height: 5,),

                CustomTextField(text: "Enter Game Name"),
                const SizedBox(height: 27,),

                gameLabel(labelText: "Description"),
                const SizedBox(height: 5,),

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
                const SizedBox(height: 33,),

                gameLabel(labelText: "Game Url"),
                const SizedBox(height: 5,),

                CustomTextField(text: "www.amongus.com"),
                const SizedBox(height: 46,),

                gameLabel(labelText: "Players Count"),
                const SizedBox(height: 5,),

                playersCount(),
                const SizedBox(height: 49,),

                gameLabel(labelText: "Category"),
                const SizedBox(height: 5,),

                DropDownButton(
                items: ["Among Us", "Mini Militia", "Skribbl.io"],
                ),
                const SizedBox(height: 41,),

                Upload(),
                const SizedBox(height: 37,),

                Center(
                  child: CustomElevatedButton(
                    buttonText: "Submit",
                    buttonAction: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GameList()));
                    },
                  ),
                ),
                const SizedBox(height: 27,),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gameLabel({required String labelText}) {
    return Text(
      labelText,
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
            const SizedBox(width: 10,),

            countContainer(count: 2),
          ],
        ),
        const SizedBox(width: 29,),

        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HintText(hintText: "Maximum count"),
            const SizedBox(width: 10,),

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
