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
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              // heading (User logo and user name)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              )

              // repository title

              // repository description

              // number of stars and programming language
            ],
          ),
        ));
  }
}
