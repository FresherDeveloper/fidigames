import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final String image;

  final String tiletext;
  const Game({required this.image, required this.tiletext});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff292333),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.asset(
              image,
              width: 100,
              height: 300,
              fit: BoxFit.cover,
            ),
            title: Text(
              tiletext,
              style: const TextStyle(
                fontFamily: "poppins",
                color: Color(0xffFFFFFF),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Column(
              children: [
                const Text(
                  "Join your crewmates in a multiplayer game of teamwork",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: "poppins",
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Button(buttonText: "Decline"),
              Button(buttonText: "Aceept", isColored: true),
              Button(buttonText: "Edit"),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton Button({
    required String buttonText,
    bool isColored = false,
  }) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        buttonText,
        style: const TextStyle(
          fontFamily: "poppins",
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(150, 40),
        onPrimary: isColored ? Color(0xffFFFFFF) : Color(0xffFCBC3C),
        primary: isColored ? const Color(0xffFCBC3C) : const Color(0xff292333),
        shape: const StadiumBorder(
          side: BorderSide(color: Color(0xffFCBC3C), width: 2),
        ),
      ),
    );
  }
}
