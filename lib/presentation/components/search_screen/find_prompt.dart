import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';

class FindPrompt extends StatelessWidget {
  const FindPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            LocaleKeys.find.tr(),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            LocaleKeys.searchGH.tr(),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
