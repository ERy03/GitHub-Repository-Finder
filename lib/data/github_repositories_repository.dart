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
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'search/repositories',
      queryParameters: {
        'page': '1',
        'q': "shop",
        'per_page': "5",
      },
    ).toString();
    final response = await _dio.get(url);
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
Future<List<GitHubRepositoryModel>> searchRepositories(
    SearchRepositoriesRef ref, String query) {
  return ref
      .watch(gitHubRepositoriesRepositoryProvider)
      .searchRepositories(query: query);
}
