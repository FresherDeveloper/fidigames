import 'package:flutter/material.dart';

import 'screens/loginPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xff1A121E),
          body: LoginPage(),
        ),
      ),
    );
  }
}
