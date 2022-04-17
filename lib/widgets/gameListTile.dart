import 'package:fidigames/models/gameDetail.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/resources/values_manager.dart';
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
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p22, horizontal: AppPadding.p16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        gameDetail.image,
                        height: 72,
                        width: 72,
                        fit: BoxFit.cover,
                      ),
                      verticalSpace(9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                ],
              ),
              horizontalSpace(AppSpace.sp22),
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
                    height: 26,
                    width: MediaQuery.of(context).size.width - 175,
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

  Widget bottomRow({bool isSelected = true}) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
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
