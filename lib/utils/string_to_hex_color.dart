import 'package:flutter/material.dart';

Color stringToHexColor(String stringColor) {
  // Remove the '#' symbol
  stringColor = stringColor.replaceAll("#", "");

  String stringColorWithFF = "FF$stringColor";

  Color color = Color(int.parse(stringColorWithFF, radix: 16));

  return color;
}
