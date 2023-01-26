import 'package:flutter/material.dart';
import 'package:ummie/config/palette.dart';

final BoxDecoration defaultDecoration = BoxDecoration(
  color: backgroundColor,
  borderRadius: const BorderRadius.all(Radius.circular((12))),
);

final BoxDecoration selectedDecoration = BoxDecoration(
  color: backgroundColor,
  border: Border.all(color: themeColor, width: 2),
  borderRadius: const BorderRadius.all(Radius.circular((12))),
);