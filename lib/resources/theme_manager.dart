import 'package:flutter/material.dart';
import './color_manager.dart';
import './font_manager.dart';
import './text_styles_manager.dart';
import './values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main app colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryWithOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.primaryWithOpacity70,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
    backgroundColor: ColorManager.dark_violet,
    scaffoldBackgroundColor: ColorManager.dark_violet,

    //app bar theme
    // ignore: prefer_const_constructors
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: ColorManager.dark_violet,
        shadowColor: ColorManager.primaryWithOpacity70,
        elevation: AppSize.s0,
        titleTextStyle: getSemiBoldStyle(fontSize: 20)),

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
    ),

    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(fontColor: ColorManager.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    //text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(
          fontSize: FontSizeManager.s16, fontColor: ColorManager.darkGrey),
      subtitle1: getMediumStyle(
          fontSize: FontSizeManager.s16, fontColor: ColorManager.lightGrey),
      caption: getLightStyle(
          fontSize: FontSizeManager.s16, fontColor: ColorManager.grey1),
      bodyText1: getRegularStyle(
          fontSize: FontSizeManager.s16, fontColor: ColorManager.grey),
    ),

    //input decoration theme -> text form field
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      //hint style
      hintStyle: getRegularStyle(),

      //label style
      labelStyle: getMediumStyle(),

      //error style
      errorStyle: getRegularStyle(fontColor: ColorManager.error),

      //enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1_5, color: ColorManager.grey),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: AppSize.s1_5, color: ColorManager.primary),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: AppSize.s1_5, color: ColorManager.error),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),

      //focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: AppSize.s1_5, color: ColorManager.primaryWithOpacity70),
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
    ),
  );
}
