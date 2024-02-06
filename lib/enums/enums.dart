import 'package:flutter/material.dart';

enum RepositoryDetails {
  issues('Issues', Icons.mode_standby_outlined, Color(0xff70D370)),
  forks('Forks', Icons.call_split_outlined, Color(0xff4C8CF7)),
  watchers('Watchers', Icons.visibility_outlined, Color(0xffF8D866)),
  license('License', Icons.balance_outlined, Color(0xffCE4F56));

  final String label;
  final IconData icon;
  final Color color;

  const RepositoryDetails(
    this.label,
    this.icon,
    this.color,
  );
}
