import 'dart:async';
import 'dart:ui';

import 'package:fidigames/models/category_model.dart';
import 'package:fidigames/models/game_list_detail.dart';
import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/screens/add_game.dart';
import 'package:fidigames/utils/shared_pref_utils.dart';
import 'package:fidigames/widgets/appbar.dart';

import 'package:fidigames/widgets/gameListTile.dart';
import 'package:fidigames/widgets/game_Catogory.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';

import '../widgets/custom_elevated_button.dart';

class GameList extends StatefulWidget {
  @override
  State<GameList> createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  bool isLoading = true;

  void myItems(
    String value,
  ) {
    isLoading = false;

    newCategory = newgame
        .where((element) =>
            element.gameCategory.toUpperCase().contains(value.toUpperCase()))
        .toList();
    if (newCategory.isEmpty) {
      Logger().wtf("message:No games in that category");
    }
  }

  var apikey = SharedPrefUtils.getLoginDetails();
  List<String> gameCategoryItems = [
    "Among Us",
    "Mini Militia",
    "Skribbl.io",
    "Call of Duty",
    "among Us",
    "FPS",
  ];

  List<GameDetail> newgame = [];
  GameListModel? gamelist;
  List<GameDetail> newCategory = [];
  String? _gameCategory;
  getCatogory() async {
    var apiKey = SharedPrefUtils.getLoginDetails();
    var headers = {'accept': 'application/json', 'api-key': '$apiKey'};

    var request = http.Request('GET',
        Uri.parse('${AppStrings.baseUrl}/games/category/$_gameCategory'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var category = await response.stream.bytesToString();
      // print(await response.stream.bytesToString());

      List<GameCategoryModel> gameCatogory =
          gameCategoryModelFromJson(category);
      Logger().wtf(gameCatogory);

      var mygame = gameCategoryModelToJson(gameCatogory);
      Logger().wtf(mygame);

      // setState(() {
      //   List<GameCategoryModel> gameCatogory =
      //       gameCategoryModelFromJson(category);
      //   Logger().wtf(gameCatogory);
      //   var mygame = gameCategoryModelToJson(gameCatogory);
      //   Logger().wtf(mygame);
      // });
    } else {
      print(response.reasonPhrase);
    }
  }

  getGame() async {
    var headers = {'accept': 'application/json', 'api-key': '$apikey'};
    var request = http.Request('GET', Uri.parse('${AppStrings.baseUrl}/games'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var allGame = await response.stream.bytesToString();

      setState(() {
        gamelist = gameListDetailFromJson(allGame);
        newgame.clear();
        for (var item in gamelist!.data) {
          newgame.add(item);
          newCategory = newgame;
        }
        isLoading = true;
        // onLoading();
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    getGame();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(
        title: AppStrings.fidigames,
      ),
      backgroundColor: const Color(0xff1A121E),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 24, right: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GameCatogory(
                  items: gameCategoryItems,
                  onDropDownValueCallback: (String value) {
                    _gameCategory = value;
                  
                    setState(() {
                      
                      myItems(value);
                    });

                    // newCategory = newgame
                    //     .where((element) => element.gameCategory
                    //         .toUpperCase()
                    //         .contains(value.toUpperCase()))
                    //     .toList();
                    // if (newCategory.isEmpty) {
                    //   Logger().wtf("message:No games in that category");

                    // }

                    getCatogory();
                  },
                ),
                const SizedBox(
                  height: 28,
                ),
                Expanded(
                  child: newCategory.isEmpty && isLoading == false
                      ? Center(
                          child:  Center(
                              child: Text("No games in that category",style: getRegularStyle(fontSize: 20))),
                        )
                      : newCategory.isNotEmpty
                          ? ListView.builder(
                              itemBuilder: (ctx, index) {
                                return GameListTile(
                                    gameDetail: newCategory[index]);
                              },
                              itemCount: newCategory.length)
                          : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 49,
            left: 108,
            right: 106,
            child: Center(
                child: CustomElevatedButton(
              buttonText: "Add Game",
              icon: SvgPicture.asset(
                "assets/icons/plus.svg",
              ),
              buttonAction: () {
                addGame();
              },
            )),
          ),
        ],
      ),
    );
  }

  void addGame() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddGame()))
        .then((value) => getGame());
  }
}
