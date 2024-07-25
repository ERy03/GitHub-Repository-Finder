import 'dart:async';
import 'package:github_repository_finder/data/github_pagination.dart';
import 'package:dio/dio.dart';
import 'package:github_repository_finder/domain/github_repository_response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_repositories_repository.g.dart';

class GitHubRepositoriesRepository {
  const GitHubRepositoriesRepository(this._dio);

  final Dio _dio;

  Future<GitHubRepositoryResponseModel> searchRepositories({
    required int page,
    String query = "",
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'search/repositories',
      queryParameters: {
        'page': "$page",
        'q': query,
        'per_page': "20",
      },
    ).toString();
    final option = Options(headers: {"accept": "application/vnd.github+json"});
    final response =
        await _dio.get(url, cancelToken: cancelToken, options: option);
    final githubRepositories =
        GitHubRepositoryResponseModel.fromMap(response.data);
    return githubRepositories;
  }
}

@riverpod
GitHubRepositoriesRepository gitHubRepositoriesRepository(
    GitHubRepositoriesRepositoryRef ref) {
  return GitHubRepositoriesRepository(Dio());
}

@riverpod
AsyncValue<int> gitHubRepositoryTotalCount(
    GitHubRepositoryTotalCountRef ref, String query) {
  return ref
      .watch(searchRepositoriesProvider(
          pagination: GitHubPagination(page: 1, query: query)))
      .whenData((value) => value.totalCount);
}

@riverpod
Future<GitHubRepositoryResponseModel> searchRepositories(
  SearchRepositoriesRef ref, {
  required GitHubPagination pagination,
}) async {
  // dio object that allows cancelling http requests
  final cancelToken = CancelToken();

  // When the provider is destroyed, cancel the http request
  // utilized when the user scrolls very fast in the list
  ref.onDispose(() {
    cancelToken.cancel();
  });

  // debouncing
  await Future.delayed(const Duration(milliseconds: 500));
  //  It is safe to use an exception here, as it will be caught by Riverpod.
  if (cancelToken.isCancelled) throw Exception('Cancelled');

  final gitHubRepositoriesResponse = ref
      .watch(gitHubRepositoriesRepositoryProvider)
      .searchRepositories(
          query: pagination.query,
          page: pagination.page,
          cancelToken: cancelToken);
  return gitHubRepositoriesResponse;
}
