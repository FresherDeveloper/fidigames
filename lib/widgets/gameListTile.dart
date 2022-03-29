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
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(
              image,
              width: 100,
              height: 300,
              fit: BoxFit.cover,
            ),
            title: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            subtitle: const Text(
              "Join your crewmates in a multiplayer game of teamwork",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(),
          BottomRow(),
        ],
      ),
    );
  }

  Row BottomRow({bool isSelected = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Row(
            children: [
              isSelected
                  ? const Icon(Icons.favorite, color: Colors.amber)
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                "240",
                style: TextStyle(
                  color: Colors.white,
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
          label: const Text("Play"),
          style: ElevatedButton.styleFrom(
            maximumSize: const Size(150, 40),
            primary: Colors.black,
            shape: const StadiumBorder(
              side: BorderSide(color: Colors.amber, width: 2),
            ),
          ),
        ),
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
    );
  }
}
