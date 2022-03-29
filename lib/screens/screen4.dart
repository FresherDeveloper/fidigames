import 'package:flutter/material.dart';

import '../widgets/game.dart';

class FourthScreen extends StatelessWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 400,
              child: const Game(
                tiletext: "Among Us",
                image: "assets/images/img1.jpg",
              ))),
    );
  }
}
