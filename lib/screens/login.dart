import 'dart:convert';

import 'package:fidigames/resources/strings_manager.dart';
import 'package:fidigames/resources/text_styles_manager.dart';
import 'package:fidigames/screens/add_game.dart';

import 'package:fidigames/widgets/custom_elevated_button.dart';
import 'package:fidigames/widgets/custom_textformfield.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:logger/logger.dart';

import '../models/users.dart';
import '../utils/shared_pref_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

createUser(String email, String password, BuildContext context) async {
  var request =
      http.Request('POST', Uri.parse('${AppStrings.baseUrl}/games/login'));

  request.body =
      json.encode({"user_username": email, "user_password": password});
  request.headers.addAll(AppStrings.headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String data = await response.stream.bytesToString();

    UserModel model = userModelFromJson(data);
    Logger().d(model.toJson());

    if (model.apiKey != null) {
      SharedPrefUtils.saveAuthToken(authToken: model.apiKey);
      var apikey = SharedPrefUtils.getLoginDetails();
      Logger().wtf(apikey);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddGame()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(model.msg)),
      );
    }
  } else {
    print(response.reasonPhrase);
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? emailValidator(String? value) {
    if (!value!.contains("@")) {
      return 'Email must contain @ symbol ';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (passwordController.text.length < 6) {
      return "Password length must be more than 6";
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 21),
            child: Form(
              key: _formKey,
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
                  const SizedBox(
                    height: 123,
                  ),
                  Text(
                    "Login",
                    style: getSemiBoldStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    text: "Email",
                    validator: emailValidator,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomTextFormField(
                    text: "Password",
                    controller: passwordController,
                    validator: passwordValidator,
                  ),
                  const SizedBox(
                    height: 53,
                  ),
                  CustomElevatedButton(
                    buttonText: "Sign In",
                    buttonAction: () {
                      final String email = emailController.text;
                      final String password = passwordController.text;

                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                        createUser(email, password, context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
