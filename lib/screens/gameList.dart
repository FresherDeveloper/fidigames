import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/widgets/appbar.dart';

import 'package:fidigames/widgets/gameListTile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/gameDetail.dart';

class GameList extends StatelessWidget {
  final List<GameDetail> gameList = [
    GameDetail(
      title: 'Amoung Us',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
      image: 'assets/images/img1.png',
      isFavroite: true,
      favCount: 13,
      minCount: 13,
      maxCount: 345,
    ),
    GameDetail(
      title: 'Mini Militia',
      description: 'join your crewmates in a multiplayer game of teamwork.',
      image: 'assets/images/img2.png',
      isFavroite: false,
      favCount: 13,
      minCount: 13,
      maxCount: 345,
    ),
    GameDetail(
      title: 'Skribbl.io',
      description: 'join your crewmates in a multiplayer game of teamwork.',
      image: 'assets/images/img3.png',
      isFavroite: false,
      favCount: 13,
      minCount: 13,
      maxCount: 345,
    ),
    GameDetail(
      title: 'Skribbl.io',
      description: 'join your crewmates in a multiplayer game of teamwork.',
      image: 'assets/images/img3.png',
      isFavroite: false,
      favCount: 13,
      minCount: 13,
      maxCount: 345,
    ),
    GameDetail(
      title: 'Skribbl.io',
      description: 'join your crewmates in a multiplayer game of teamwork.',
      image: 'assets/images/img3.png',
      isFavroite: false,
      favCount: 13,
      minCount: 13,
      maxCount: 345,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(title: AppStrings.fidigames,),
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
                const SizedBox(height: 28,),

                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                  return GameListTile(
                    gameDetail: gameList[index],
                  );
                    },
                    itemCount: gameList.length,
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
              child: ElevatedButton(
                onPressed: () {
                  print("button is tapped");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/plus.svg",
                    ),
                    Text(
                      "Add Game",
                      style: getSemiBoldStyle(
                        fontSize: 14,
                        fontColor: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
