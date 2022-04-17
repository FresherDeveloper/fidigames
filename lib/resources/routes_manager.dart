// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:udemy_advanced_flutter_course/presentation/forgot_password/forgot_password_view.dart';
// import 'package:udemy_advanced_flutter_course/presentation/home/home_view.dart';
// import 'package:udemy_advanced_flutter_course/presentation/login/login_view.dart';
// import 'package:udemy_advanced_flutter_course/presentation/register/register_view.dart';
// import 'package:udemy_advanced_flutter_course/presentation/resources/strings_manager.dart';
// import 'package:udemy_advanced_flutter_course/presentation/spalsh/splash_view.dart';

// class Routes {
//   static const String splashRoute = "/";
//   static const String loginRoute = "/login";
//   static const String registerRoute = "/register";
//   static const String forgotPasswordRoute = "/forgotPassword";
//   static const String homeRoute = "/home";
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => SplashView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => RegisterView());
//       case Routes.forgotPasswordRoute:
//         return MaterialPageRoute(builder: (_) => ForgotPasswordView());
//       case Routes.homeRoute:
//         return MaterialPageRoute(builder: (_) => HomeView());
//       default:
//         return undefinedRoute();
//     }
//   }

//   static Route<dynamic> undefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: Text(AppStrings.noRouteFound),
//         ),
//         body: Center(
//           child: Text(AppStrings.noRouteFound),
//         ),
//       ),
//     );
//   }
// }
