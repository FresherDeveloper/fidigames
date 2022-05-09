import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fidigames/models/add_game_model.dart';
import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/resources/values_manager.dart';
import 'package:fidigames/screens/game_list.dart';
import 'package:fidigames/utils/shared_pref_utils.dart';
import 'package:fidigames/widgets/appbar.dart';

import 'package:fidigames/widgets/custom_elevated_button.dart';
import 'package:fidigames/widgets/custom_textformfield.dart';
import 'package:fidigames/widgets/dropdownbutton.dart';

import 'package:fidigames/widgets/upload.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../widgets/hinttext.dart';

class AddGame extends StatefulWidget {
  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  String? addGameValidator(String? value) {
    if (value!.isEmpty) {
      return 'This field should not be empty';
    }
    return null;
  }

  String? playersCountValidator(String? value) {
    if (value!.isEmpty) {
      return '';
    }
    return null;
  }

  String? imageUrl;

  bool showImageUploadError = false;

  String? _gameCategory;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController minpController = TextEditingController();

  final TextEditingController maxpController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController gameUrlController = TextEditingController();

  final TextEditingController urlController = TextEditingController();

  addGame(
    String gameName,
    String gameDescription,
    String? gameImgUrl,
    String gameUrl,
    String gameMinp,
    String gameMaxp,
    String? gameCategory,
    BuildContext context,
  ) async {
    var apiKey = SharedPrefUtils.getLoginDetails();
    Logger().w(apiKey);
    var headers = {
      'accept': 'application/json',
      'api-key':"$apiKey", 
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('${AppStrings.baseUrl}/games'));
    request.body = json.encode({
      "game_name": gameName,
      "game_description": gameDescription,
      "game_image_url": gameImgUrl,
      "game_url": gameUrl,
      "game_minp": gameMinp,
      "game_maxp": gameMaxp,
      "game_category": gameCategory
    });
    request.headers.addAll(headers);
    Logger().d(request.body);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var gameData = await response.stream.bytesToString();
      AddGameModel game = addGameModelFromJson(gameData);
      Logger().d(gameData);
      if (game.msg != null) {
        // Navigator.pop(context);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GameList()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(game.msg)),
        );
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> gameCategory = ["Among Us", "Mini Militia", "Skribbl.io"];
    return SafeArea(
      child: Scaffold(
        appBar: getAppbar(
            onBackPress: () {},
            title: AppStrings.addAGame,
            automaticallyImplyLeading: true),
        backgroundColor: const Color(0xff1A121E),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p16,
              left: AppPadding.p24,
              right: AppPadding.p24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gameLabel(labelText: "Name of the Game"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    text: "Enter Game Name",
                    controller: nameController,
                    validator: addGameValidator,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  gameLabel(labelText: "Description"),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: addGameValidator,
                    maxLines: 4,
                    controller: descriptionController,
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
                  const SizedBox(
                    height: 33,
                  ),
                  gameLabel(labelText: "Game Url"),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    text: "www.amongus.com",
                    controller: gameUrlController,
                    validator: addGameValidator,
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  gameLabel(labelText: "Players Count"),
                  const SizedBox(
                    height: 5,
                  ),
                  playersCount(),
                  const SizedBox(
                    height: 49,
                  ),
                  gameLabel(labelText: "Category"),
                  const SizedBox(
                    height: 5,
                  ),
                  DropDownButton(
                    items: gameCategory,
                    onDropDownValueCallback: (String value) {
                      _gameCategory = value;
                    },
                  ),
                  const SizedBox(
                    height: 41,
                  ),
                  Column(
                   
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Upload(
                        onSelectImage: (String imagepath) {
                          Logger().w('IMAGE PATH IS ${imagepath}');
                          imageUrl = imagepath;
                          setState(
                            () {
                              showImageUploadError = false;
                            },
                          );
                        },
                        erroroccured:
                            (imageUrl == null && showImageUploadError == true),
                      ),
                      if (imageUrl == null && showImageUploadError == true)
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child:  Text(
                            'Please Upload Image',
                            style: TextStyle(color: Colors.red[700] ,fontSize: 12,),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  Center(
                    child: CustomElevatedButton(
                      buttonText: "Submit",
                      buttonAction: () {
                        setState(() {
                          showImageUploadError = true;
                        });
                        final String gameName = nameController.text;
                        final String gameDescription =
                            descriptionController.text;
                        final String gameUrl = gameUrlController.text;
                        final String gameMinp = minpController.text;
                        final String gameMaxp = maxpController.text;
                        if (_formKey.currentState!.validate() &&
                            imageUrl != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('loading')),
                          );
                          addGame(gameName, gameDescription, imageUrl, gameUrl,
                              gameMinp, gameMaxp, _gameCategory, context);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                ],
              ),
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
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HintText(hintText: "Minimum Count"),
            countContainer(
              count: "2",
              controller: minpController,
            ),
          ],
        ),
        const SizedBox(
          width: 18,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HintText(hintText: "Maximum count"),
            countContainer(
              count: "8",
              controller: maxpController,
            ),
          ],
        ),
      ],
    );
  }

  Widget countContainer(
      {required String count, TextEditingController? controller}) {
    return Container(
      height: 34,
      width: 34,
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
        color: const Color(0xff292333),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: 
          [TextFormField(
            controller: controller,
            validator: playersCountValidator,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff292333),
              hintText: count,
              hintStyle: getRegularStyle(fontSize: 16),
            ),
            style: getRegularStyle(fontSize: 16),
          ),
          ],
        ),
      ),
    );
  }
}
