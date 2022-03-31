import 'package:fidigames/screens/gameCard.dart';
import 'package:fidigames/widgets/customedElevatedButton.dart';
import 'package:fidigames/widgets/gameListTile.dart';
import 'package:fidigames/widgets/titleText.dart';
import 'package:flutter/material.dart';

class GameList extends StatelessWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1A121E),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleText(title: "Fidigames"),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 32,
                  width: 135,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      children: const [
                        Text(
                          "Catogories",
                          style: TextStyle(
                            color: Color(0xffFEFEFE),
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(135, 32),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GameListTile(
                          text: "Among Us",
                          image: "assets/images/img1.jpg",
                          isFavourite: true,
                        ),
                        GameListTile(
                          text: "Mini Militia",
                          image: "assets/images/img2.jpg",
                        ),
                        GameListTile(
                          text: "Skribbl.io",
                          image: "assets/images/img3.jpg",
                        ),
                        GameListTile(
                          text: "Skribbl.io",
                          image: "assets/images/img3.jpg",
                        ),
                        GameListTile(
                          text: "Skribbl.io",
                          image: "assets/images/img3.jpg",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 125,
            left: 90,
            right: 90,
            child: CustomedElevatedButton(
              buttonText: "Add Game",
              buttonAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GameCard()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
