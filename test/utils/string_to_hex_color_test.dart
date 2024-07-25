import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/utils/string_to_hex_color.dart';

void main() {
  group('stringToHexColor', () {
    test('converts valid hex color string to Color', () {
      expect(stringToHexColor('#FFFFFF'), const Color(0xFFFFFFFF));
      expect(stringToHexColor('#000000'), const Color(0xFF000000));
      expect(stringToHexColor('#FF0000'), const Color(0xFFFF0000));
      expect(stringToHexColor('00FF00'), const Color(0xFF00FF00));
      expect(stringToHexColor('0000FF'), const Color(0xFF0000FF));
    });

    test('handles hex color strings without #', () {
      expect(stringToHexColor('FFFFFF'), const Color(0xFFFFFFFF));
      expect(stringToHexColor('000000'), const Color(0xFF000000));
    });

    test('returns default color for invalid hex color strings', () {
      expect(stringToHexColor('#GGGGGG'), const Color(0xFF808080));
      expect(stringToHexColor('XYZ123'), const Color(0xFF808080));
      expect(stringToHexColor('#12345G'), const Color(0xFF808080));
    });
  });
}
