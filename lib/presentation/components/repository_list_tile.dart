import 'package:flutter/material.dart';
import 'package:github_repository_finder/presentation/components/repository_overview.dart';
import 'package:github_repository_finder/presentation/screens/repository_detail_screen.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const RepositoryDetailScreen()),
          );
          // TODO navigate to details page
        },
        child: const RepositoryOverview());
  }
}
