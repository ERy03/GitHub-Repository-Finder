import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/utils/number_formatter.dart';

void main() {
  group('numberWithComma', () {
    test('formats number with commas correctly', () {
      expect(numberWithComma(1000), '1,000');
      expect(numberWithComma(1000000), '1,000,000');
      expect(numberWithComma(987654321), '987,654,321');
    });

    test('formats small numbers without commas correctly', () {
      expect(numberWithComma(123), '123');
      expect(numberWithComma(45), '45');
      expect(numberWithComma(0), '0');
    });
  });

  group('numberCompact', () {
    test('formats number compactly correctly', () {
      expect(numberCompact(1000), '1K');
      expect(numberCompact(1200000), '1.2M');
      expect(numberCompact(987654321), '988M');
    });

    test('formats small numbers without compact notation correctly', () {
      expect(numberCompact(123), '123');
      expect(numberCompact(45), '45');
      expect(numberCompact(0), '0');
    });
  });
}
