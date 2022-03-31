import 'package:fidigames/screens/addGame.dart';
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
            const Padding(
              padding: EdgeInsets.only(
                top: 93,
              ),
              child: Text(
                "Fidigames",
                style: TextStyle(
                  color: Color(0xffFEFEFE),
                  fontFamily: "poppins",
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                ),
              ),
            ),
            const SizedBox(
              height: 123,
            ),
            const Text(
              "Login",
              style: TextStyle(
                color: Color(0xffFEFEFE),
                fontFamily: "poppins",
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 39,
            ),
            CustomedTextField(text: "Email"),
            const SizedBox(
              height: 22,
            ),
            CustomedTextField(text: "Password"),
            const SizedBox(
              height: 53,
            ),
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
