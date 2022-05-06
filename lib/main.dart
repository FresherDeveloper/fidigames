import 'package:fidigames/resources/theme_manager.dart';
import 'package:fidigames/screens/add_game.dart';
import 'package:fidigames/screens/login.dart';
import 'package:fidigames/utils/shared_pref_utils.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await SharedPrefUtils.init();
  runApp(HomePage());

}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? authToken = SharedPrefUtils.getLoginDetails();
    // SharedPrefUtils.clear();
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      home: 
      authToken != null ? AddGame() : LoginPage(),
    );
  }
}
