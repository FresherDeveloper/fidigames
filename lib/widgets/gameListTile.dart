import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/gameDetail.dart';
import '../resources/text_styles_manager.dart';
import '../resources/values_manager.dart';

class GameListTile extends StatelessWidget {
  final GameDetail gameDetail;

  GameListTile({required this.gameDetail});

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
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                gameDetail.image,

                //height: 72,
                width: 72,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              gameDetail.title,
              style: getSemiBoldStyle(fontSize: 18),
            ),
            subtitle: Text(gameDetail.description,
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
              gameDetail.isFavroite
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
                "240",
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
                "4 - 6 Players",
                style: getLightStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
