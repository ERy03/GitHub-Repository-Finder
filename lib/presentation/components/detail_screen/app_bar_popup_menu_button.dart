import 'package:flutter/material.dart';
import 'package:github_repository_finder/utils/url_launcher.dart';

class AppBarPopupMenuButton extends StatefulWidget {
  const AppBarPopupMenuButton({super.key, required this.htmlUrl});

  final String htmlUrl;

  @override
  State<AppBarPopupMenuButton> createState() => _AppBarPopupMenuButtonState();
}

class _AppBarPopupMenuButtonState extends State<AppBarPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
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
        MenuItemButton(
          style: ButtonStyle(
              fixedSize: const MaterialStatePropertyAll(Size(210, 55)),
              shape: MaterialStatePropertyAll(LinearBorder.bottom(
                  side: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 0,
              )))),
          trailingIcon: Icon(
            Icons.ios_share_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          child: const Text(
            'Share via...',
          ),
          onPressed: () {
            // share
          },
        ),
        MenuItemButton(
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
    );
  }
}
