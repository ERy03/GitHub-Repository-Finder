import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/data/github_readme_repository.dart';
import 'package:github_repository_finder/presentation/components/detail_screen/markdown_content.dart';
import 'package:github_repository_finder/presentation/components/shared/error_messages.dart';

void main() {
  testWidgets(
      'MarkdownContent shows MarkdownBody when getRepositoryReadmeProvider is successful',
      (tester) async {
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getRepositoryReadmeProvider("owner", "repo").overrideWith((ref) {
            return "# This is a Readme";
          })
        ],
        child: const MaterialApp(
            home: Scaffold(
          body: MarkdownContent(repo: "repo", owner: "owner"),
        ))));

    expect(find.byType(MarkdownBody), findsOne);
  });
  testWidgets(
      'MarkdownContent shows ErrorMessages when getRepositoryReadmeProvider throws error',
      (tester) async {
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getRepositoryReadmeProvider("owner", "repo").overrideWith((ref) {
            throw Exception();
          })
        ],
        child: const MaterialApp(
            home: Scaffold(
          body: MarkdownContent(repo: "repo", owner: "owner"),
        ))));

    expect(find.byType(MarkdownBody), findsNothing);
    expect(find.byType(ErrorMessages), findsOne);
  });
}
