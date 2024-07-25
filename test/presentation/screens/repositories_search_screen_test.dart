import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/data/github_pagination.dart';
import 'package:github_repository_finder/data/github_repositories_repository.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/domain/github_repository_owner.dart';
import 'package:github_repository_finder/domain/github_repository_response_model.dart';
import 'package:github_repository_finder/presentation/components/search_screen/custom_search_bar.dart';
import 'package:github_repository_finder/presentation/components/search_screen/find_prompt.dart';
import 'package:github_repository_finder/presentation/components/search_screen/no_github_repositories_found.dart';
import 'package:github_repository_finder/presentation/components/search_screen/repository_list_tile.dart';
import 'package:github_repository_finder/presentation/components/shared/error_messages.dart';
import 'package:github_repository_finder/presentation/screens/repositories_search_screen.dart';
import 'package:github_repository_finder/theme/theme_mode_provider.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'RepositoriesSearchScreen shows search bar and FindPrompt when query is empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      gitHubRepositroySearchTextProvider.overrideWith((ref) {
        return "";
      }),
      themeModeProvider.overrideWith((ref) {
        return true;
      }),
    ], child: const MaterialApp(home: RepositoriesSearchScreen())));
    // Check for the presence of the search bar
    expect(find.byType(CustomSearchBar), findsOne);
    // Check for the presence of the FindPrompt widget
    expect(find.byType(FindPrompt), findsOne);
  });
  testWidgets('RepositoriesSearchScreen shows ErrorMessages Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      themeModeProvider.overrideWith((ref) {
        return true;
      }),
    ], child: const MaterialApp(home: RepositoriesSearchScreen())));

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pump();

    // Circular progress indicator
    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.pumpAndSettle();
    // Make sure Circular progress indicator is gone
    expect(find.byType(CircularProgressIndicator), findsNothing);
    // Check for the presence of the Errors widget
    expect(find.byType(ErrorMessages), findsOne);
  });

  testWidgets(
      'RepositoriesSearchScreen shows NoGitHubRepositoriesFound Widget when total count is 0',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      searchRepositoriesProvider(
              pagination: GitHubPagination(page: 1, query: "hi"))
          .overrideWith((ref) {
        return const GitHubRepositoryResponseModel(totalCount: 0, items: []);
      }),
      themeModeProvider.overrideWith((ref) {
        return true;
      }),
    ], child: const MaterialApp(home: RepositoriesSearchScreen())));

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(NoGitHubRepositoriesFound), findsOne);
  });
  testWidgets(
      'RepositoriesSearchScreen shows ErrorMessage Widget when gitHubRepositoriesRepositoryProvider throws Exception',
      (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(overrides: [
      gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
        throw Exception();
      }),
      themeModeProvider.overrideWith((ref) {
        return true;
      }),
    ], child: const MaterialApp(home: RepositoriesSearchScreen())));

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pumpAndSettle();

    // Check for the presence of the NoGitHubRepositoriesFound widget
    expect(find.byType(ErrorMessages), findsOne);
  });
  testWidgets(
      'RepositoriesSearchScreen shows RepositoryListTile Widget when successful',
      (WidgetTester tester) async {
    MockDio mockDio = MockDio();

    GitHubRepositoriesRepository repository =
        GitHubRepositoriesRepository(mockDio);

    const testRepositoryModel = GitHubRepositoryModel(
        name: 'Test',
        htmlUrl: 'test.com',
        homepage: 'test',
        stargazersCount: 1,
        watchersCount: 0,
        forksCount: 2,
        openIssuesCount: 1,
        owner: RepositoryOwner(
          login: "test",
          avatarUrl: "avatarUrl",
          htmlUrl: "htmlUrl",
        ));

    final testRepositoryModelJson = testRepositoryModel.toMap();

    final dioResponseData = {
      'total_count': 1,
      'items': [testRepositoryModelJson],
    };

    const responseData = GitHubRepositoryResponseModel(
        totalCount: 1, items: [testRepositoryModel]);

    final dioResponse = Response(
      requestOptions: RequestOptions(path: ''),
      data: dioResponseData,
      statusCode: 200,
    );

    when(() => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        )).thenAnswer((_) async => dioResponse);

    final result = await repository.searchRepositories(page: 1, query: "hi");

    await tester.pumpWidget(ProviderScope(overrides: [
      gitHubRepositoriesRepositoryProvider.overrideWith((ref) {
        return repository;
      }),
      themeModeProvider.overrideWith((ref) {
        return true;
      }),
    ], child: const MaterialApp(home: RepositoriesSearchScreen())));

    await tester.enterText(find.byType(CustomSearchBar), 'hi');

    await tester.pump();

    // Circular progress indicator

    expect(find.byType(CircularProgressIndicator), findsOne);

    await tester.pumpAndSettle();

    // Circular progress indicator gone
    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Check for the presence of RepositoryListTile widget
    expect(find.byType(RepositoryListTile), findsOne);

    expect(result, responseData);
    expect(result.totalCount, 1);
    expect(result.items, [testRepositoryModel]);

    verify(() => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        )).called(2);
    verifyNoMoreInteractions(mockDio);
  });
}
