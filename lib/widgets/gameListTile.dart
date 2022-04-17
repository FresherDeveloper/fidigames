import 'package:fidigames/models/gameDetail.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/widgets/common_widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      padding: const EdgeInsets.only(top: 22, left: 5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: Column(
                      children: [
                        Image.asset(
                          gameDetail.image,
                          height: 72,
                          width: 72,
                          fit: BoxFit.cover,
                        ),
                        verticalSpace(9),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            gameDetail.isFavroite
                                ? SvgPicture.asset(
                                    "assets/icons/favourite_color.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/icons/favourite_outlined.svg",
                                  ),
                            horizontalSpace(13),
                            Text(
                              "240",
                              style: getLightStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    gameDetail.title,
                    style: getSemiBoldStyle(fontSize: 18),
                  ),
                  verticalSpace(2),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(gameDetail.description,
                        maxLines: 2,
                        style: getLightStyle(
                          fontSize: 10,
                          fontColor: Color(0xffFFFFFF),
                        )),
                  ),
                  verticalSpace(15),
                  bottomRow(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Row bottomRow({bool isSelected = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/play_button.svg",
          ),
          label: Text("Play", style: getSemiBoldStyle()),
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(150, 40),
            primary: const Color(0xff0000004D),
            shape: const StadiumBorder(
              side: BorderSide(color: Color(0xffFCBC3C), width: 1),
            ),
          ),
        ),
        horizontalSpace(25),
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/users.svg",
            ),
            horizontalSpace(13),
            Text(
              "4 - 6 Players",
              style: getLightStyle(),
            ),
          ],
        ),
      ],
    );
  }
}
