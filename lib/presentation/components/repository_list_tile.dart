import 'package:flutter/material.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // TODO navigate to details page
        },
        child: SafeArea(
          top: false,
          bottom: false,
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Theme.of(context).dividerColor, width: 1))),
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
                      const Expanded(
                        child: Text(
                          "Username",
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // repository title
                  // TODO replace hardcoded text with actual repo title
                  const Text(
                    "Repository Title",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // repository description
                  // TODO replace hardcoded text with actual repo description
                  // * Description can be null
                  const Text(
                    "This is the description for the respository. It can be quite long or short. If there is no description, do not show",
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // number of stars and programming language
                  Row(
                    children: <Widget>[
                      // Stars
                      const Icon(
                        Icons.star_outline,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      // TODO Replace hardcoded star number with actual number
                      const Text(
                        "30",
                        style: TextStyle(fontSize: 18),
                      ),

                      const SizedBox(
                        width: 15,
                      ),

                      // Programming Language
                      Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
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
        ));
  }
}
