import 'package:fidigames/models/game_list_detail.dart';
import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/screens/add_game.dart';
import 'package:fidigames/utils/shared_pref_utils.dart';
import 'package:fidigames/widgets/appbar.dart';

import 'package:fidigames/widgets/gameListTile.dart';
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
  var apikey = SharedPrefUtils.getLoginDetails();

  GameListModel? gamelist;
  List<GameDetail> newgame = [];
  getGame() async {
    var headers = {'accept': 'application/json', 'api-key': '$apikey'};
    var request = http.Request(
        'GET', Uri.parse('${AppStrings.baseUrl}/games'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var allGame = await response.stream.bytesToString();

      setState(() {
        gamelist = gameListDetailFromJson(allGame);
        newgame.clear();
        for (var item in gamelist!.data) {
          newgame.add(item);
        }
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
                SizedBox(
                  height: 32,
                  width: 135,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Catogories",
                          style: getMediumStyle(),
                        ),
                        SvgPicture.asset(
                          "assets/icons/arrow_down2.svg",
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(135, 32),
                      primary: const Color(0xff1A121E),
                      shape: const StadiumBorder(
                        side: BorderSide(
                          color: Color(0xffBAB8BB),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Expanded(
                  child: newgame != null
                      ? ListView.builder(
                          itemBuilder: (ctx, index) {
                            return GameListTile(
                              gameDetail: newgame[index],
                            );
                          },
                         
                          itemCount: newgame.length)
                      : const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        ),
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
