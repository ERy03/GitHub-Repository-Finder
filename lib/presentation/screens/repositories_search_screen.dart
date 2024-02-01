import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repository_finder/presentation/components/custom_search_bar.dart';

class RepositoriesSearchScreen extends StatelessWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset(
        'assets/icons/github-original-wordmark.svg',
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        height: 50,
        width: 50,
      )),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Search Bar
            CustomSearchBar(),

            // List of Repositories
          ],
        ),
      ),
    );
  }
}
