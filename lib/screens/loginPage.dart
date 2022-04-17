import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/screens/addGame.dart';
import 'package:fidigames/widgets/common_widgets/space.dart';
import 'package:fidigames/widgets/customedElevatedButton.dart';
import 'package:fidigames/widgets/customedTextField.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 21),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 93,
              ),
              child: Text(
                "Fidigames",
                style: getSemiBoldStyle(fontSize: 32),
              ),
            ),
            verticalSpace(123),
            Text(
              "Login",
              style: getSemiBoldStyle(fontSize: 18),
            ),
            verticalSpace(39),
            CustomedTextField(text: "Email"),
            verticalSpace(22),
            CustomedTextField(text: "Password"),
            verticalSpace(53),
            CustomedElevatedButton(
              buttonText: "Sign In",
              buttonAction: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddGame()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
