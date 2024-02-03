import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repository_finder/presentation/components/custom_search_bar.dart';
import 'package:github_repository_finder/presentation/components/repository_list_tile.dart';

class RepositoriesSearchScreen extends StatelessWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/icons/github-original-wordmark.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 50,
            width: 50,
          )),
      body: Column(
        children: [
          // Search Bar
          const CustomSearchBar(),

          // List of Repositories
          Expanded(
              child: ListView(
            children: [
              for (var i = 0; i < 3; i++) const RepositoryListTile(),
            ],
          ))
        ],
      ),
    );
  }
}
