// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repositories_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gitHubRepositoriesRepositoryHash() =>
    r'4af9eb4450d34857a899dde276ea43c8e69df880';

/// See also [gitHubRepositoriesRepository].
@ProviderFor(gitHubRepositoriesRepository)
final gitHubRepositoriesRepositoryProvider =
    AutoDisposeProvider<GitHubRepositoriesRepository>.internal(
  gitHubRepositoriesRepository,
  name: r'gitHubRepositoriesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gitHubRepositoriesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GitHubRepositoriesRepositoryRef
    = AutoDisposeProviderRef<GitHubRepositoriesRepository>;
String _$gitHubRepositoryTotalCountHash() =>
    r'd17aa2a4b1cc52b066574a44ff3e70b54df97a22';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [gitHubRepositoryTotalCount].
@ProviderFor(gitHubRepositoryTotalCount)
const gitHubRepositoryTotalCountProvider = GitHubRepositoryTotalCountFamily();

/// See also [gitHubRepositoryTotalCount].
class GitHubRepositoryTotalCountFamily extends Family<AsyncValue<int>> {
  /// See also [gitHubRepositoryTotalCount].
  const GitHubRepositoryTotalCountFamily();

  /// See also [gitHubRepositoryTotalCount].
  GitHubRepositoryTotalCountProvider call(
    String query,
  ) {
    return GitHubRepositoryTotalCountProvider(
      query,
    );
  }

  @override
  GitHubRepositoryTotalCountProvider getProviderOverride(
    covariant GitHubRepositoryTotalCountProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gitHubRepositoryTotalCountProvider';
}

/// See also [gitHubRepositoryTotalCount].
class GitHubRepositoryTotalCountProvider
    extends AutoDisposeProvider<AsyncValue<int>> {
  /// See also [gitHubRepositoryTotalCount].
  GitHubRepositoryTotalCountProvider(
    String query,
  ) : this._internal(
          (ref) => gitHubRepositoryTotalCount(
            ref as GitHubRepositoryTotalCountRef,
            query,
          ),
          from: gitHubRepositoryTotalCountProvider,
          name: r'gitHubRepositoryTotalCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gitHubRepositoryTotalCountHash,
          dependencies: GitHubRepositoryTotalCountFamily._dependencies,
          allTransitiveDependencies:
              GitHubRepositoryTotalCountFamily._allTransitiveDependencies,
          query: query,
        );

  GitHubRepositoryTotalCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    AsyncValue<int> Function(GitHubRepositoryTotalCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GitHubRepositoryTotalCountProvider._internal(
        (ref) => create(ref as GitHubRepositoryTotalCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<int>> createElement() {
    return _GitHubRepositoryTotalCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GitHubRepositoryTotalCountProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GitHubRepositoryTotalCountRef on AutoDisposeProviderRef<AsyncValue<int>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _GitHubRepositoryTotalCountProviderElement
    extends AutoDisposeProviderElement<AsyncValue<int>>
    with GitHubRepositoryTotalCountRef {
  _GitHubRepositoryTotalCountProviderElement(super.provider);

  @override
  String get query => (origin as GitHubRepositoryTotalCountProvider).query;
}

String _$searchRepositoriesHash() =>
    r'2fb3e5e9ce37b12cc15dc1a3eb58fc6e60ea0552';

/// See also [searchRepositories].
@ProviderFor(searchRepositories)
const searchRepositoriesProvider = SearchRepositoriesFamily();

/// See also [searchRepositories].
class SearchRepositoriesFamily
    extends Family<AsyncValue<GitHubRepositoryResponseModel>> {
  /// See also [searchRepositories].
  const SearchRepositoriesFamily();

  /// See also [searchRepositories].
  SearchRepositoriesProvider call({
    required GitHubPagination pagination,
  }) {
    return SearchRepositoriesProvider(
      pagination: pagination,
    );
  }

  @override
  SearchRepositoriesProvider getProviderOverride(
    covariant SearchRepositoriesProvider provider,
  ) {
    return call(
      pagination: provider.pagination,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchRepositoriesProvider';
}

/// See also [searchRepositories].
class SearchRepositoriesProvider
    extends AutoDisposeFutureProvider<GitHubRepositoryResponseModel> {
  /// See also [searchRepositories].
  SearchRepositoriesProvider({
    required GitHubPagination pagination,
  }) : this._internal(
          (ref) => searchRepositories(
            ref as SearchRepositoriesRef,
            pagination: pagination,
          ),
          from: searchRepositoriesProvider,
          name: r'searchRepositoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRepositoriesHash,
          dependencies: SearchRepositoriesFamily._dependencies,
          allTransitiveDependencies:
              SearchRepositoriesFamily._allTransitiveDependencies,
          pagination: pagination,
        );

  SearchRepositoriesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pagination,
  }) : super.internal();

  final GitHubPagination pagination;

  @override
  Override overrideWith(
    FutureOr<GitHubRepositoryResponseModel> Function(
            SearchRepositoriesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchRepositoriesProvider._internal(
        (ref) => create(ref as SearchRepositoriesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pagination: pagination,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GitHubRepositoryResponseModel>
      createElement() {
    return _SearchRepositoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoriesProvider &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRepositoriesRef
    on AutoDisposeFutureProviderRef<GitHubRepositoryResponseModel> {
  /// The parameter `pagination` of this provider.
  GitHubPagination get pagination;
}

class _SearchRepositoriesProviderElement
    extends AutoDisposeFutureProviderElement<GitHubRepositoryResponseModel>
    with SearchRepositoriesRef {
  _SearchRepositoriesProviderElement(super.provider);

  @override
  GitHubPagination get pagination =>
      (origin as SearchRepositoriesProvider).pagination;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
