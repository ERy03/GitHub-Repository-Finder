import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/enums/enums.dart';
import 'package:github_repository_finder/presentation/components/repository_detail_tile.dart';
import 'package:github_repository_finder/presentation/components/repository_overview.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen(
      {super.key, required this.gitHubRepositoryModel});

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                        label: RepositoryDetails.issues.label,
                        icon: RepositoryDetails.issues.icon,
                        color: RepositoryDetails.issues.color,
                        number: gitHubRepositoryModel.openIssuesCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.forks.label,
                        icon: RepositoryDetails.forks.icon,
                        color: RepositoryDetails.forks.color,
                        number: gitHubRepositoryModel.forksCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.watchers.label,
                        icon: RepositoryDetails.watchers.icon,
                        color: RepositoryDetails.watchers.color,
                        number: gitHubRepositoryModel.watchersCount,
                      ),
                      RepositoryDetailTile(
                        label: RepositoryDetails.license.label,
                        icon: RepositoryDetails.license.icon,
                        color: RepositoryDetails.license.color,
                        license:
                            gitHubRepositoryModel.license?.spdxId ?? 'None',
                      ),
                    ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
