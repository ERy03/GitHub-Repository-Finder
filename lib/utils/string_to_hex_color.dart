import 'package:flutter/material.dart';

Color stringToHexColor(String stringColor) {
  // Remove the '#' symbol
  stringColor = stringColor.replaceAll("#", "");

  String stringColorWithFF = "FF$stringColor";

  try {
    Color color = Color(int.parse(stringColorWithFF, radix: 16));
    return color;
  } catch (_) {
    return const Color(0xFF808080);
  }
}
