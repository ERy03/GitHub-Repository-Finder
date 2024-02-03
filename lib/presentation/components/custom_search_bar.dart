import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
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
          onChanged: (text) => {
            // TODO: search repository using GitHUb API
          },
        ),
      ),
    );
  }
}
