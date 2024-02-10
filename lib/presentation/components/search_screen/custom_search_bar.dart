import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          controller: _controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          leading: const Icon(Icons.search),
          hintText: 'Search Repository',
          onChanged: (text) => ref
              .read(gitHubRepositroySearchTextProvider.notifier)
              .state = text,
        ),
      ),
    );
  }
}
