import 'package:flutter/cupertino.dart';

class ColorManager {
  static Color primary = darkViolet;
  static Color primaryWithOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");

  //new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color grey3 = HexColor.fromHex("#FEFEFE");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f32");
  static Color darkViolet = HexColor.fromHex('#1A121E');
}

extension HexColor on Color {
  //Convert hexadecimal color to Color object
  static Color fromHex(String hexColorCode) {
    hexColorCode =
        hexColorCode.replaceAll('#', ''); //Trim the color with only the code

    //IF the given color has no opacity then set opacity with 100% by 'FF'
    if (hexColorCode.length == 6) {
      hexColorCode = "FF" + hexColorCode;
    }

    return Color(int.parse(hexColorCode, radix: 16));
  }
}
