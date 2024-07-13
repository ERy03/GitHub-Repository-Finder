import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';
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
        elevation: WidgetStatePropertyAll(1),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
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
                minimumSize: WidgetStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.ios_share_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: Text(
                LocaleKeys.shareVia.tr(),
                style: Theme.of(context).textTheme.labelLarge,
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
                minimumSize: WidgetStatePropertyAll(Size(210, 50)),
              ),
              trailingIcon: Icon(
                Icons.public_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              child: Text(
                LocaleKeys.viewOnGitHub.tr(),
                style: Theme.of(context).textTheme.labelLarge,
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
