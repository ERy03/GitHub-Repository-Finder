import 'package:flutter/material.dart';
import 'package:github_repository_finder/utils/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AppBarPopupMenuButton extends StatefulWidget {
  const AppBarPopupMenuButton(
      {super.key,
      required this.htmlUrl,
      required this.repoAuthor,
      required this.repoTitle});

  final String htmlUrl;
  final String repoAuthor;
  final String repoTitle;

  @override
  State<AppBarPopupMenuButton> createState() => _AppBarPopupMenuButtonState();
}

class _AppBarPopupMenuButtonState extends State<AppBarPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: const Offset(-175, 0),
      style: const MenuStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)))),
      ),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(
            Icons.more_horiz,
          ),
        );
      },
      menuChildren: <Widget>[
        Column(
          children: [
            MenuItemButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.ios_share_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: const Text(
                'Share via...',
              ),
              onPressed: () async {
                // sharedPosition is required for iPad
                final box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  widget.htmlUrl,
                  subject:
                      "Check out ${widget.repoAuthor}'s ${widget.repoTitle} repository",
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size,
                );
              },
            ),
            const Divider(
              height: 0,
            ),
            MenuItemButton(
              style: const ButtonStyle(
                minimumSize: MaterialStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.public_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: const Text(
                'View on GitHub',
              ),
              onPressed: () {
                gitHubLaunchUrl(widget.htmlUrl);
              },
            )
          ],
        ),
      ],
    );
  }
}
