import 'dart:io';

import 'package:fidigames/models/dislike_model.dart';
import 'package:fidigames/models/game_list_detail.dart';
import 'package:fidigames/models/like_model.dart';
import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/utils/shared_pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../resources/text_styles_manager.dart';
import '../resources/values_manager.dart';

class GameListTile extends StatefulWidget {
  final GameDetail gameDetail;

  GameListTile({required this.gameDetail});

  @override
  State<GameListTile> createState() => _GameListTileState();
}

class _GameListTileState extends State<GameListTile> {
  bool isLiked = false;

  int likeCount = 0;

  getLike() async {
    var apiKey = SharedPrefUtils.getLoginDetails();
    var headers = {
      'accept': 'application/json',
      'api-key': "$apiKey",
    };
    var request =
        http.Request('PUT', Uri.parse('${AppStrings.baseUrl}/games/2/addlike'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var like = await response.stream.bytesToString();
      Logger().d(like);
      setState(() {
        LikeIncrementModel likeCounter = likeIncrementModelFromJson(like);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  getDislike() async {
    var apiKeys = SharedPrefUtils.getLoginDetails();
    var headers = {
      'accept': 'application/json',
      'api-key': "$apiKeys",
    };
    var request = http.Request(
        'DELETE', Uri.parse('${AppStrings.baseUrl}/games/1/removelike'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var dislike = await response.stream.bytesToString();
      Logger().d(dislike);
      setState(() {
        LikeDecrementtModel dislikeCount = likeDecrementtModelFromJson(dislike);
      });
    } else {
      print(response.reasonPhrase);
    }
  }

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
                  File(widget.gameDetail.gameImageUrl),
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
              widget.gameDetail.gameName,
              style: getSemiBoldStyle(fontSize: 18),
            ),
            subtitle: Text(widget.gameDetail.gameDescription,
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
              LikeButton(
                isLiked: isLiked,
                likeCount: likeCount,
                size: 12,
                likeBuilder: (isLiked) {
                  return isLiked
                      ? SvgPicture.asset(
                          "assets/icons/favourite_color.svg",
                        )
                      : SvgPicture.asset(
                          "assets/icons/favourite_outlined.svg",
                        );
                },
                likeCountPadding: const EdgeInsets.only(left: 10),
                countBuilder: (count, isLiked, text) {
                  return Text(text,
                      style: getLightStyle(
                        fontColor: const Color(0xffFFFFFF),
                      ));
                },
                onTap: (isLiked) async {
                  this.isLiked = !isLiked;

                  if (isLiked) {
                    likeCount = likeCount - 1;
                    getDislike();
                  } else {
                    likeCount = likeCount + 1;
                    getLike();
                  }

                
                  return !isLiked;
                },
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
                "${widget.gameDetail.gameMinp} -${widget.gameDetail.gameMaxp} Players",
                style: getLightStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
