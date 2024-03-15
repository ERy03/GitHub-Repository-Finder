import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:github_repository_finder/data/github_repositories_repository.dart';
import 'package:github_repository_finder/theme/theme_mode_provider.dart';
import 'package:github_repository_finder/presentation/components/search_screen/custom_app_bar.dart';
import 'package:github_repository_finder/presentation/components/search_screen/custom_search_bar.dart';
import 'package:github_repository_finder/presentation/components/search_screen/find_prompt.dart';
import 'package:github_repository_finder/presentation/components/search_screen/repository_list_tile.dart';

class RepositoriesSearchScreen extends ConsumerWidget {
  const RepositoriesSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(gitHubRepositroySearchTextProvider);
    final githubRepositories = ref.watch(searchRepositoriesProvider(query));
    final themeModeState = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: CustomAppBar(
          themeModeProvider: themeModeState,
          context: context,
          toggle: (val) {
            ref.read(themeModeProvider.notifier).update((state) => val);
          }),
      body: Column(
        children: [
          // Search Bar
          const CustomSearchBar(),

          // List of Repositories
          Expanded(
              child: githubRepositories.when(
                  data: (repositories) {
                    if (repositories.isEmpty) {
                      return const FindPrompt();
                    } else {
                      return ListView(
                        children: [
                          for (var githubRepository in repositories)
                            RepositoryListTile(
                              gitHubRepositoryModel: githubRepository,
                            )
                        ],
                      );
                    }
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
