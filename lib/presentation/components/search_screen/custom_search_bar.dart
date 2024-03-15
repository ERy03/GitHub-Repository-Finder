import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_repository_finder/generated/locale_keys.g.dart';

final gitHubRepositroySearchTextProvider = StateProvider<String>((ref) {
  return '';
});

class CustomSearchBar extends ConsumerStatefulWidget {
  const CustomSearchBar({super.key});

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16),
      child: SafeArea(
        top: false,
        bottom: false,
        child: SearchBar(
          elevation: MaterialStateProperty.all(1),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          controller: _controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          leading: const Icon(Icons.search),
          hintText: LocaleKeys.searchRepository.tr(),
          onChanged: (text) => ref
              .read(gitHubRepositroySearchTextProvider.notifier)
              .state = text,
        ),
      ),
    );
  }
}
