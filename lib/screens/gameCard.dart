import 'package:flutter/material.dart';

import '../widgets/game.dart';

class GameCard extends StatelessWidget {
  const GameCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Game(
          tiletext: "Among Us",
          image: "assets/images/img1.jpg",
        ),
      ),
    );
  }
}
