import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/utils/number_formatter.dart';
import 'package:github_repository_finder/utils/url_launcher.dart';

class RepositoryOverview extends StatelessWidget {
  const RepositoryOverview({
    super.key,
    this.isDetailScreen = false,
    required this.gitHubRepositoryModel,
  });

  final GitHubRepositoryModel gitHubRepositoryModel;
  final bool isDetailScreen;

  @override
  Widget build(BuildContext context) {
    final verticalSpacing = SizedBox(
      height: isDetailScreen ? 8 : 5,
    );
    final horizontalSpacing = SizedBox(
      width: isDetailScreen ? 10 : 3,
    );
    return SafeArea(
      top: false,
      bottom: false,
      child: SizedBox(
        child: Container(
          decoration: isDetailScreen
              ? null
              : BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).dividerColor, width: 0))),
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // heading (User logo and user name)
              GestureDetector(
                onTap: () => isDetailScreen
                    ? gitHubLaunchUrl(gitHubRepositoryModel.owner.htmlUrl)
                    : null,
                child: Row(
                  children: <Widget>[
                    CachedNetworkImage(
                      height: 32,
                      width: 32,
                      imageUrl: gitHubRepositoryModel.owner.avatarUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover)),
                      ),
                      placeholder: (context, url) => Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(gitHubRepositoryModel.owner.login,
                          overflow: TextOverflow.ellipsis,
                          style: isDetailScreen
                              ? const TextStyle(fontSize: 18)
                              : null),
                    )
                  ],
                ),
              ),

              verticalSpacing,

              // repository title
              Text(
                gitHubRepositoryModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight:
                        isDetailScreen ? FontWeight.w800 : FontWeight.bold,
                    fontSize: isDetailScreen ? 22 : 16),
              ),

              verticalSpacing,

              // repository description
              // * Description can be null
              Visibility(
                visible: gitHubRepositoryModel.description != null,
                child: Text(
                  gitHubRepositoryModel.description!,
                  style: TextStyle(fontSize: isDetailScreen ? 17 : 16),
                ),
              ),

              verticalSpacing,

              // Only in detail screen, show url to website
              Visibility(
                visible:
                    isDetailScreen && gitHubRepositoryModel.homepage.isNotEmpty,
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.link,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () =>
                            gitHubLaunchUrl(gitHubRepositoryModel.homepage),
                        child: Text(gitHubRepositoryModel.homepage,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 17)),
                      ),
                    )
                  ],
                ),
              ),

              verticalSpacing,

              // number of stars and programming language
              Row(
                children: <Widget>[
                  // Stars
                  const Icon(
                    Icons.star_outline,
                    size: 18,
                  ),
                  horizontalSpacing,
                  isDetailScreen
                      ? Text(
                          "${numberCompact(gitHubRepositoryModel.stargazersCount)} ${gitHubRepositoryModel.stargazersCount == 1 ? "star" : "stars"}",
                          style: const TextStyle(fontSize: 18),
                        )
                      : Text(
                          numberWithComma(
                              gitHubRepositoryModel.stargazersCount),
                          style: const TextStyle(fontSize: 18),
                        ),

                  SizedBox(
                    width: isDetailScreen ? 20 : 15,
                  ),

                  // Programming Language
                  Visibility(
                    visible: gitHubRepositoryModel.language != null,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                    ),
                  ),
                  horizontalSpacing,
                  Text(
                    gitHubRepositoryModel.language!,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
