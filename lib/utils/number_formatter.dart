import 'package:intl/intl.dart';

String numberWithComma(int num) {
  final formatter = NumberFormat("###,###", "en_US");
  return formatter.format(num);
}

String numberCompact(int num) {
  final formatter = NumberFormat.compact();
  return formatter.format(num);
}
