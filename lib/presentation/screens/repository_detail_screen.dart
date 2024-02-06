import 'package:flutter/material.dart';
import 'package:github_repository_finder/enums/enums.dart';
import 'package:github_repository_finder/presentation/components/repository_detail_tile.dart';
import 'package:github_repository_finder/presentation/components/repository_overview.dart';

class RepositoryDetailScreen extends StatelessWidget {
  const RepositoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RepositoryOverview(
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
                      for (var details in RepositoryDetails.values)
                        RepositoryDetailTile(
                          label: details.label,
                          icon: details.icon,
                          color: details.color,
                          licenseOrNumber: (
                            license: 'MIT',
                            number: 10000
                          ), //TODO pass actual numbers
                        )
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
