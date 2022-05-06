import 'dart:io';

import 'package:fidigames/models/game_list_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/text_styles_manager.dart';
import '../resources/values_manager.dart';

class GameListTile extends StatelessWidget {
  final GameDetail gameDetail;

  GameListTile({required this.gameDetail});
  bool isFavroite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff292333),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p22, horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 20,
            leading: SizedBox(
              width: 72,
              height: 72,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(gameDetail.gameImageUrl),
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      "assets/images/img1.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            title: Text(
              gameDetail.gameName,
              style: getSemiBoldStyle(fontSize: 18),
            ),
            subtitle: Text(gameDetail.gameDescription,
                maxLines: 2,
                style: getLightStyle(
                  fontSize: 10,
                  fontColor: Color(0xffFFFFFF),
                )),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              isFavroite
                  ? SvgPicture.asset(
                      "assets/icons/favourite_color.svg",
                    )
                  : SvgPicture.asset(
                      "assets/icons/favourite_outlined.svg",
                    ),
              const SizedBox(
                width: 13,
              ),
              Text(
                "${gameDetail.gameLikesCount}",
                style: getLightStyle(),
              ),
              const SizedBox(
                width: 22,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/play_button.svg",
                ),
                label: Text("Play", style: getSemiBoldStyle()),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  primary: const Color(0xff0000004D),
                  shape: const StadiumBorder(
                    side: BorderSide(color: Color(0xffFCBC3C), width: 1),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              SvgPicture.asset(
                "assets/icons/users.svg",
              ),
              const SizedBox(
                width: 13,
              ),
              Text(
                "${gameDetail.gameMinp} -${gameDetail.gameMaxp} Players",
                style: getLightStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
