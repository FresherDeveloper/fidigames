import 'package:fidigames/screens/screen4.dart';
import 'package:fidigames/widgets/gameListTile.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    "Fidigames",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    children: const [
                      Text("Catogories"),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    primary: Colors.black,
                    shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
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
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FourthScreen()));
              },
              icon: const Icon(
                Icons.add,
              ),
              label: const Text("Add Game"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                primary: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
