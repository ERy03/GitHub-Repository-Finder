import 'package:flutter/material.dart';
import 'package:github_repository_finder/presentation/components/repository_overview.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [
          RepositoryOverview(
            isDetailScreen: true,
          )
        ],
      ),
    );
  }
}
