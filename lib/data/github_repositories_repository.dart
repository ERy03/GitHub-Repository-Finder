import 'dart:async';

import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:dio/dio.dart';
import 'package:github_repository_finder/domain/github_repository_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repositories_repository.g.dart';

class GitHubRepositoriesRepository {
  const GitHubRepositoriesRepository(this._dio);

  final Dio _dio;

  Future<List<GitHubRepositoryModel>> searchRepositories({
    // required int page,
    String query = "",
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'search/repositories',
      queryParameters: {
        'page': '1',
        'q': query,
        'per_page': "5",
      },
    ).toString();
    print('dio: searchRepositories($query)');
    final response = await _dio.get(url, cancelToken: cancelToken);
    final githubRepositories =
        GitHubRepositoryResponseModel.fromMap(response.data);
    return githubRepositories.items;
  }
}

@riverpod
GitHubRepositoriesRepository gitHubRepositoriesRepository(
    GitHubRepositoriesRepositoryRef ref) {
  return GitHubRepositoriesRepository(Dio());
}

@riverpod
FutureOr<List<GitHubRepositoryModel>> searchRepositories(
    SearchRepositoriesRef ref, String query) async {
  print('init: searchRepositories($query)');

  // dio object that allows cancelling http requests
  final cancelToken = CancelToken();

  // When the provider is destroyed, cancel the http request
  ref.onDispose(() {
    print('dispose: searchRepositories($query)');
    cancelToken.cancel();
  });

  if (query.isNotEmpty) {
    // debouncing
    await Future.delayed(const Duration(milliseconds: 500));
    //  It is safe to use an exception here, as it will be caught by Riverpod.
    if (cancelToken.isCancelled) throw Exception('Cancelled');
    return ref
        .watch(gitHubRepositoriesRepositoryProvider)
        .searchRepositories(query: query, cancelToken: cancelToken);
  } else {
    return [];
  }
}
