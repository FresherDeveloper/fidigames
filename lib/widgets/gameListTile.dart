import 'package:flutter/material.dart';

class GameListTile extends StatelessWidget {
  final String image;
  final bool? isFavourite;
  final String text;
  GameListTile({required this.image, this.isFavourite, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
        color: Color(0xff292333),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            title: Text(
              text,
              style: const TextStyle(
                fontFamily: "poppins",
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              "Join your crewmates in a multiplayer game of teamwork",
              style: TextStyle(
                color: Color(0xffFFFFFF),
                fontFamily: "poppins",
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(),
          BottomRow(),
        ],
      ),
    );
  }

  Row BottomRow({bool isSelected = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Row(
            children: [
              isSelected
                  ? const Icon(
                      Icons.favorite,
                      color: Color(0xffFCBC3C),
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Color(0xffFFFFFF),
                    ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "240",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: "poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow,
          ),
          label: const Text(
            "Play",
            style: TextStyle(
              color: Color(0xffFFFFFF),
              fontFamily: "poppins",
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(150, 40),
            primary: Colors.black,
            shape: const StadiumBorder(
              side: BorderSide(color: Color(0xffFCBC3C), width: 1),
            ),
          ),
        ),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.people,
                color: Color(0xffFFFFFF),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "4 - 6 Players",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontFamily: "poppins",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
