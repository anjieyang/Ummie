import 'package:flutter/painting.dart';

final Color themeColor = HexColor("0EA259");
final Color searchBarColor = HexColor("504F4F");
final Color backgroundColor = HexColor("EEEEEE");

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}