import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/enums/enums.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';
import 'package:github_repository_finder/presentation/components/detail_screen/app_bar_popup_menu_button.dart';
import 'package:github_repository_finder/presentation/components/detail_screen/markdown_content.dart';
import 'package:github_repository_finder/presentation/components/detail_screen/repository_detail_tile.dart';
import 'package:github_repository_finder/presentation/components/shared/repository_overview.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen(
      {super.key, required this.gitHubRepositoryModel});

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarPopupMenuButton(
            htmlUrl: gitHubRepositoryModel.htmlUrl,
            repoAuthor: gitHubRepositoryModel.owner.login,
            repoTitle: gitHubRepositoryModel.name,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RepositoryOverview(
              gitHubRepositoryModel: gitHubRepositoryModel,
              isDetailScreen: true,
            ),
            const SizedBox(
              height: 10,
            ),
            // repository detail
            SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.1),
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Theme.of(context).dividerColor,
                          width: 0,
                        ),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(children: [
                      RepositoryDetailTile(
                        label: RepositoryDetails.issues.label.tr(),
                        icon: RepositoryDetails.issues.icon,
                        color: RepositoryDetails.issues.color,
                        number: gitHubRepositoryModel.openIssuesCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.forks.label.tr(),
                        icon: RepositoryDetails.forks.icon,
                        color: RepositoryDetails.forks.color,
                        number: gitHubRepositoryModel.forksCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.watchers.label.tr(),
                        icon: RepositoryDetails.watchers.icon,
                        color: RepositoryDetails.watchers.color,
                        number: gitHubRepositoryModel.watchersCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.license.label.tr(),
                        icon: RepositoryDetails.license.icon,
                        color: RepositoryDetails.license.color,
                        license: gitHubRepositoryModel.license?.spdxId ??
                            LocaleKeys.none.tr(),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
            // Displaying repository's readme
            MarkdownContent(
                repo: gitHubRepositoryModel.name,
                owner: gitHubRepositoryModel.owner.login)
          ],
        ),
      ),
    );
  }
}
