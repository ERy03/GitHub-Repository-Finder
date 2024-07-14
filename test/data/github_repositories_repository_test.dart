import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_finder/data/github_repositories_repository.dart';
import 'package:github_repository_finder/domain/github_repository_model.dart';
import 'package:github_repository_finder/domain/github_repository_owner.dart';
import 'package:github_repository_finder/domain/github_repository_response_model.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late GitHubRepositoriesRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = GitHubRepositoriesRepository(mockDio);
  });

  tearDown(() {
    verify(() => mockDio.get(
          any(),
          cancelToken: any(named: 'cancelToken'),
          options: any(named: 'options'),
        )).called(1);
    verifyNoMoreInteractions(mockDio);
  });

  group('searchRepositories', () {
    const page = 1;
    const query = 'flutter';

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

    DioException dioException(int statusCode) {
      return DioException(
          requestOptions: RequestOptions(path: ''),
          response: Response(
              requestOptions: RequestOptions(path: ''),
              statusCode: statusCode));
    }

    test('returns GitHubRepositoryResponseModel on successful API call',
        () async {
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

      final result =
          await repository.searchRepositories(page: page, query: query);

      expect(result, responseData);
      expect(result.totalCount, 1);
      expect(result.items, [testRepositoryModel]);
    });

    test('throws a DioError with status code 403', () async {
      when(() => mockDio.get(
            any(),
            cancelToken: any(named: 'cancelToken'),
            options: any(named: 'options'),
          )).thenThrow(dioException(403));

      expect(
        () async =>
            await repository.searchRepositories(page: page, query: query),
        throwsA(isA<DioException>()
            .having((e) => e.response?.statusCode, 'statusCode', 403)),
      );
    });
    test('throws a DioError with status code 503', () async {
      when(() => mockDio.get(
            any(),
            cancelToken: any(named: 'cancelToken'),
            options: any(named: 'options'),
          )).thenThrow(dioException(503));

      expect(
        () async =>
            await repository.searchRepositories(page: page, query: query),
        throwsA(isA<DioException>()
            .having((e) => e.response?.statusCode, 'statusCode', 503)),
      );
    });
    test('throws a DioError for connection error', () async {
      when(() => mockDio.get(
            any(),
            cancelToken: any(named: 'cancelToken'),
            options: any(named: 'options'),
          )).thenThrow(DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionError,
          response: Response(
            requestOptions: RequestOptions(path: ''),
          )));

      expect(
        () async =>
            await repository.searchRepositories(page: page, query: query),
        throwsA(isA<DioException>().having(
          (e) => e.type,
          'DioExceptionType',
          DioExceptionType.connectionError,
        )),
      );
    });
  });
}
