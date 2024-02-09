import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/presentation/components/repository_overview.dart';
import 'package:github_repository_finder/presentation/screens/repository_detail_screen.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key, required this.gitHubRepositoryModel});

  final GitHubRepositoryModel gitHubRepositoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RepositoryDetailScreen(
                      gitHubRepositoryModel: gitHubRepositoryModel,
                    )),
          );
        },
        child: RepositoryOverview(
          gitHubRepositoryModel: gitHubRepositoryModel,
        ));
  }
}
