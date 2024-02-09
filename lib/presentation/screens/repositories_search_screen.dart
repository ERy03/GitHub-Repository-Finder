import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repository_finder/data/github_repositories_repository.dart';
import 'package:github_repository_finder/presentation/components/custom_search_bar.dart';
import 'package:github_repository_finder/presentation/components/repository_list_tile.dart';

class RepositoriesSearchScreen extends ConsumerWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(gitHubRepositroySearchTextProvider);
    final githubRepositories = ref.watch(searchRepositoriesProvider('flutter'));

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
              child: githubRepositories.when(
                  data: (repositories) {
                    return ListView(
                      children: [
                        for (var githubRepository in repositories)
                          RepositoryListTile(
                            gitHubRepositoryModel: githubRepository,
                          )
                      ],
                    );
                  },
                  error: (e, _) => Center(child: Text(e.toString())),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ))),
        ],
      ),
    );
  }
}
