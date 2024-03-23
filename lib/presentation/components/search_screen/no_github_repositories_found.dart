import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';

class NoGitHubRepositoriesFound extends StatelessWidget {
  const NoGitHubRepositoriesFound({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.12),
      child: Center(
          child: Text(
        LocaleKeys.noRepositories.tr(),
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
      )),
    );
  }
}
