import 'dart:async';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_readme_repository.g.dart';

class GithubReadmeRepository {
  const GithubReadmeRepository(this._dio);

  final Dio _dio;

  Future<String> getRepositoryReadme({
    required String owner,
    required String repo,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'repos/$owner/$repo/readme',
    ).toString();
    final option = Options(
        headers: {"Accept": "application/vnd.github.raw+json"},
        responseType: ResponseType.plain);

    final response = await _dio.get(url, options: option);
    return response.data;
  }
}

@riverpod
GithubReadmeRepository gitHubReadmeRepository(GitHubReadmeRepositoryRef ref) {
  return GithubReadmeRepository(Dio());
}

@riverpod
Future<String> getRepositoryReadme(
    GetRepositoryReadmeRef ref, String owner, String repo) {
  final rawMd = ref
      .read(gitHubReadmeRepositoryProvider)
      .getRepositoryReadme(owner: owner, repo: repo);
  return rawMd;
}
