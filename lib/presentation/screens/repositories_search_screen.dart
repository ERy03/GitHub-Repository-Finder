import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository_finder/data/github_pagination.dart';

import 'package:github_repository_finder/data/github_repositories_repository.dart';
import 'package:github_repository_finder/presentation/components/search_screen/no_github_repositories_found.dart';
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
    final themeModeState = ref.watch(themeModeProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: query.isEmpty
                  ? const FindPrompt()
                  : ref.watch(gitHubRepositoryTotalCountProvider(query)).when(
                      error: (e, _) => Center(child: Text(e.toString())),
                      loading: () => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                      data: (repositoriesCount) {
                        return repositoriesCount == 0
                            ? const NoGitHubRepositoriesFound()
                            : ListView.custom(
                                semanticChildCount: repositoriesCount,
                                childrenDelegate: SliverChildBuilderDelegate(
                                    childCount: repositoriesCount,
                                    (context, index) {
                                  // obtain page number (20 is the number of results obtain by calling the api)
                                  final page = index ~/ 20 + 1;
                                  // indexInPage is used to get the actual repository from the list
                                  final indexInPage = index % 20;

                                  final githubRepositories = ref.watch(
                                      searchRepositoriesProvider(
                                          pagination: GitHubPagination(
                                              page: page, query: query)));

                                  return githubRepositories.when(
                                      data: (gitHubResponse) {
                                    return RepositoryListTile(
                                      gitHubRepositoryModel:
                                          gitHubResponse.items[indexInPage],
                                    );
                                  }, error: (e, _) {
                                    if (indexInPage != 0) return null;
                                    return Center(child: Text(e.toString()));
                                  }, loading: () {
                                    if (indexInPage != 0) return null;
                                    return const Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ),
                                    );
                                  });
                                }));
                      }))
        ],
      ),
    );
  }
}
