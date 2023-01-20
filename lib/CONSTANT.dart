import 'package:flutter/material.dart';
import 'package:ummie/HexColor.dart';

final Color THEMECOLOR = HexColor("0EA259");
final Color SEARCHBARCOLOR = HexColor("504F4F");
final Color BACKGROUNDCOLOR = HexColor("EEEEEE");

final BoxDecoration DEFAULTDECORATION = BoxDecoration(
  color: BACKGROUNDCOLOR,
  borderRadius: const BorderRadius.all(Radius.circular((12))),
);

final BoxDecoration SELECTEDDECORATION = BoxDecoration(
  color: BACKGROUNDCOLOR,
  border: Border.all(color: THEMECOLOR, width: 2),
  borderRadius: const BorderRadius.all(Radius.circular((12))),
);