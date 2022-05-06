// import 'package:fidigames/resources/text_styles_manager.dart';
// import 'package:fidigames/screens/addGame.dart';

// import 'package:fidigames/widgets/customElevatedButton.dart';
// import 'package:fidigames/widgets/customTextField.dart';

// import 'package:flutter/material.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.only(left: 24, right: 21),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 93,
//               ),
//               child: Text(
//                 "Fidigames",
//                 style: getSemiBoldStyle(fontSize: 32),
//               ),
//             ),
//            const SizedBox(height: 123,),

//             Text(
//               "Login",
//               style: getSemiBoldStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 39,),

//             CustomTextField(text: "Email"),
//             const SizedBox(height: 22,),

//             CustomTextField(text: "Password"),
//             const SizedBox(height: 53,),

//             CustomElevatedButton(
//               buttonText: "Sign In",
//               buttonAction: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const AddGame()));
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
