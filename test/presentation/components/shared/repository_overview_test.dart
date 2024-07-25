import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/data/github_language_colors_repository.dart';
import 'package:github_repository_finder/domain/github_language_colors.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/domain/github_repository_owner.dart';
import 'package:github_repository_finder/presentation/components/shared/repository_overview.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const testRepositoryModel = GitHubRepositoryModel(
      name: 'Test',
      htmlUrl: 'test.com',
      homepage: 'test',
      language: "Dart",
      stargazersCount: 1,
      watchersCount: 0,
      forksCount: 2,
      openIssuesCount: 1,
      owner: RepositoryOwner(
        login: "test",
        avatarUrl: "avatarUrl",
        htmlUrl: "htmlUrl",
      ));

  testWidgets(
      'repository overview shows Color(0xFF808080) Container for langauge color when getLanguageColorsProvider throws error',
      (tester) async {
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getLanguageColorsProvider.overrideWith((ref) {
            throw Exception();
          })
        ],
        child: const MaterialApp(
            home: Scaffold(
          body: RepositoryOverview(gitHubRepositoryModel: testRepositoryModel),
        ))));

    // Language color widget
    predicate(Widget widget) =>
        widget is Container &&
        widget.decoration ==
            const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF808080),
            );

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
    expect(find.text("Dart"), findsOneWidget);
  });
  testWidgets(
      'repository overview shows Color(0xFF814CCC) Container for langauge color when getLanguageColorsProvider is successful',
      (tester) async {
    await tester.pumpWidget(ProviderScope(
        overrides: [
          getLanguageColorsProvider.overrideWith((ref) {
            return [
              const GitHubLanguageColors(name: "Dart", color: "#814CCC"),
            ];
          })
        ],
        child: const MaterialApp(
            home: Scaffold(
          body: RepositoryOverview(gitHubRepositoryModel: testRepositoryModel),
        ))));

    // Language color widget
    predicate(Widget widget) =>
        widget is Container &&
        widget.decoration ==
            const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF814CCC),
            );

    expect(find.byWidgetPredicate(predicate), findsOneWidget);
    expect(find.text("Dart"), findsOneWidget);
  });
}
