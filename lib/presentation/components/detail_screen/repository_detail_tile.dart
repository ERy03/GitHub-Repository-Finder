import 'package:flutter/material.dart';
import 'package:github_repository_finder/enums/enums.dart';
import 'package:github_repository_finder/utils/number_formatter.dart';

class RepositoryDetailTile extends StatelessWidget {
  const RepositoryDetailTile({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    this.number,
    this.license,
  });

  final String label;
  final IconData icon;
  final Color color;
  final int? number;
  final String? license;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon inside colored container
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        const SizedBox(
          width: 10,
        ),
        // Label with number
        Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: label == RepositoryDetails.license.label
                  ? null
                  : BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 0,
                    ))),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 17),
                    ),
                    Text(
                      license ?? numberWithComma(number ?? 0),
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
