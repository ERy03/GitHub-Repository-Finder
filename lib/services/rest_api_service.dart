import 'package:dio/dio.dart';
import 'package:github_repository_finder/models/github_repository_model.dart';
import 'package:github_repository_finder/models/github_repository_response_model.dart';

class RestApiService {
  const RestApiService(this._dio);

  final Dio _dio;

  Future<List<GitHubRepositoryModel>> searchRepositories({
    required int page,
    String query = "",
    CancelToken? cancelToken,
  }) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.github.com',
      path: 'search/repositories',
      queryParameters: {
        'page': '$page',
        'q': query,
        'per_page': "20",
      },
    ).toString();
    final response = await _dio.get(url, cancelToken: cancelToken);
    final githubRepositories =
        GitHubRepositoryResponseModel.fromMap(response.data);
    return githubRepositories.items;
  }
}
