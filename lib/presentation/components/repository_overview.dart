import 'package:flutter/material.dart';
import 'package:github_repository_finder/utils/number_formatter.dart';

class RepositoryOverview extends StatelessWidget {
  const RepositoryOverview({
    super.key,
    this.isDetailScreen = false,
  });

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
              Row(
                children: <Widget>[
                  // TODO Replace container with actual image
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text("Username",
                        overflow: TextOverflow.ellipsis,
                        style: isDetailScreen
                            ? const TextStyle(fontSize: 18)
                            : null),
                  )
                ],
              ),

              verticalSpacing,

              // repository title
              // TODO replace hardcoded text with actual repo title
              Text(
                "Repository Title",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight:
                        isDetailScreen ? FontWeight.w800 : FontWeight.bold,
                    fontSize: isDetailScreen ? 22 : 16),
              ),

              verticalSpacing,

              // repository description
              // TODO replace hardcoded text with actual repo description
              // * Description can be null
              Text(
                "This is the description for the respository. It can be quite long or short. If there is no description, do not show",
                style: TextStyle(fontSize: isDetailScreen ? 17 : 16),
              ),

              verticalSpacing,

              // Only in detail screen, show url to website
              Visibility(
                visible:
                    isDetailScreen, // TODO (condition if is detail screen && has link to website)
                child: Row(
                  children: <Widget>[
                    const Icon(
                      Icons.link,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // TODO Go to url
                        },
                        child: const Text(
                            "www.website_url.org/", // TODO replace with actual url
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 17)),
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
                  // TODO Replace hardcoded star number with actual number
                  isDetailScreen
                      ? Text(
                          "${numberCompact(1000)} stars", // TODO if number is 1, display star instead of stars
                          style: const TextStyle(fontSize: 18),
                        )
                      : Text(
                          numberWithComma(500),
                          style: const TextStyle(fontSize: 18),
                        ),

                  SizedBox(
                    width: isDetailScreen ? 20 : 15,
                  ),

                  // Programming Language
                  Container(
                    height: 18,
                    width: 18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                  ),
                  horizontalSpacing,
                  // TODO Replace hardcoded Programming Language with actual Programming Language
                  const Text(
                    "Dart",
                    style: TextStyle(fontSize: 18),
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
