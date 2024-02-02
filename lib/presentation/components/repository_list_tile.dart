import 'package:flutter/material.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // TODO navigate to details page
        },
        child: Container(
          color: Colors.yellow,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).dividerColor, width: 1))),
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: <Widget>[
                // heading (User logo and user name)
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
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
                ),

                // repository title

                // repository description

                // number of stars and programming language
              ],
            ),
          ),
        ));
  }
}
