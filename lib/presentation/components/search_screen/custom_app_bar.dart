import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(
      {required bool themeModeProvider,
      required BuildContext context,
      required Function toggle,
      super.key})
      : super(
          centerTitle: true,
          title: SvgPicture.asset(
            'assets/icons/github-original-wordmark.svg',
            // Change color of GitHub Logo depending on Theme Mode
            colorFilter: themeModeProvider
                ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            height: 50,
            width: 50,
          ),
          actions: [
            MenuAnchor(
              alignmentOffset: const Offset(-175, 0),
              style: const MenuStyle(
                elevation: WidgetStatePropertyAll(1),
                padding:
                    WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 0)),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
              ),
              builder: (BuildContext context, MenuController controller,
                  Widget? child) {
                return IconButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      controller.close();
                    } else {
                      controller.open();
                    }
                  },
                  icon: const Icon(
                    Icons.settings,
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
                        Icons.translate_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      child: Text(
                        LocaleKeys.appLanguage.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onPressed: () {
                        AppSettings.openAppSettings(
                            type: AppSettingsType.settings);
                      },
                    ),
                    const Divider(
                      height: 0,
                    ),
                    MenuItemButton(
                      style: const ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(210, 50)),
                      ),
                      trailingIcon: Switch.adaptive(
                          value: themeModeProvider,
                          onChanged: (val) {
                            toggle(val);
                          }),
                      child: Text(
                        themeModeProvider
                            ? LocaleKeys.darkMode.tr()
                            : LocaleKeys.lightMode.tr(),
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        );
}
