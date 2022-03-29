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
        color: Colors.grey.shade800,
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
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            subtitle: Column(
              children: [
                const Text(
                  "Join your crewmates in a multiplayer game of teamwork",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(),
                Container(
                  child: Row(
                    children: const [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "4 - 6 Players",
                        style: TextStyle(
                          color: Colors.white,
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
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
      ),
      label: Text(buttonText),
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(150, 40),
        primary: isColored ? Colors.amber : Colors.black,
        shape: const StadiumBorder(
          side: BorderSide(color: Colors.amber, width: 2),
        ),
      ),
    );
  }
}
