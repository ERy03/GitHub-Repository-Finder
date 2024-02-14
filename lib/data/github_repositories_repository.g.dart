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
String _$searchRepositoriesHash() =>
    r'dad426938bfe329639d34686e7abefd6f530f8e5';

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

/// See also [searchRepositories].
@ProviderFor(searchRepositories)
const searchRepositoriesProvider = SearchRepositoriesFamily();

/// See also [searchRepositories].
class SearchRepositoriesFamily
    extends Family<AsyncValue<List<GitHubRepositoryModel>>> {
  /// See also [searchRepositories].
  const SearchRepositoriesFamily();

  /// See also [searchRepositories].
  SearchRepositoriesProvider call(
    String query,
  ) {
    return SearchRepositoriesProvider(
      query,
    );
  }

  @override
  SearchRepositoriesProvider getProviderOverride(
    covariant SearchRepositoriesProvider provider,
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
  String? get name => r'searchRepositoriesProvider';
}

/// See also [searchRepositories].
class SearchRepositoriesProvider
    extends AutoDisposeFutureProvider<List<GitHubRepositoryModel>> {
  /// See also [searchRepositories].
  SearchRepositoriesProvider(
    String query,
  ) : this._internal(
          (ref) => searchRepositories(
            ref as SearchRepositoriesRef,
            query,
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
          query: query,
        );

  SearchRepositoriesProvider._internal(
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
    FutureOr<List<GitHubRepositoryModel>> Function(
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
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<GitHubRepositoryModel>>
      createElement() {
    return _SearchRepositoriesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRepositoriesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRepositoriesRef
    on AutoDisposeFutureProviderRef<List<GitHubRepositoryModel>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchRepositoriesProviderElement
    extends AutoDisposeFutureProviderElement<List<GitHubRepositoryModel>>
    with SearchRepositoriesRef {
  _SearchRepositoriesProviderElement(super.provider);

  @override
  String get query => (origin as SearchRepositoriesProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
