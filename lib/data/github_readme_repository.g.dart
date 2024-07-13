// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_readme_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gitHubReadmeRepositoryHash() =>
    r'5936bbe448d7eaa2e3c1322077da1c2941d8509e';

/// See also [gitHubReadmeRepository].
@ProviderFor(gitHubReadmeRepository)
final gitHubReadmeRepositoryProvider =
    AutoDisposeProvider<GithubReadmeRepository>.internal(
  gitHubReadmeRepository,
  name: r'gitHubReadmeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gitHubReadmeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GitHubReadmeRepositoryRef
    = AutoDisposeProviderRef<GithubReadmeRepository>;
String _$getRepositoryReadmeHash() =>
    r'00b3836b9e6f59602cb5ad65c3d15e7827de368e';

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

/// See also [getRepositoryReadme].
@ProviderFor(getRepositoryReadme)
const getRepositoryReadmeProvider = GetRepositoryReadmeFamily();

/// See also [getRepositoryReadme].
class GetRepositoryReadmeFamily extends Family<AsyncValue<String>> {
  /// See also [getRepositoryReadme].
  const GetRepositoryReadmeFamily();

  /// See also [getRepositoryReadme].
  GetRepositoryReadmeProvider call(
    String owner,
    String repo,
  ) {
    return GetRepositoryReadmeProvider(
      owner,
      repo,
    );
  }

  @override
  GetRepositoryReadmeProvider getProviderOverride(
    covariant GetRepositoryReadmeProvider provider,
  ) {
    return call(
      provider.owner,
      provider.repo,
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
  String? get name => r'getRepositoryReadmeProvider';
}

/// See also [getRepositoryReadme].
class GetRepositoryReadmeProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getRepositoryReadme].
  GetRepositoryReadmeProvider(
    String owner,
    String repo,
  ) : this._internal(
          (ref) => getRepositoryReadme(
            ref as GetRepositoryReadmeRef,
            owner,
            repo,
          ),
          from: getRepositoryReadmeProvider,
          name: r'getRepositoryReadmeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getRepositoryReadmeHash,
          dependencies: GetRepositoryReadmeFamily._dependencies,
          allTransitiveDependencies:
              GetRepositoryReadmeFamily._allTransitiveDependencies,
          owner: owner,
          repo: repo,
        );

  GetRepositoryReadmeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.owner,
    required this.repo,
  }) : super.internal();

  final String owner;
  final String repo;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetRepositoryReadmeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetRepositoryReadmeProvider._internal(
        (ref) => create(ref as GetRepositoryReadmeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        owner: owner,
        repo: repo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetRepositoryReadmeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetRepositoryReadmeProvider &&
        other.owner == owner &&
        other.repo == repo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, owner.hashCode);
    hash = _SystemHash.combine(hash, repo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetRepositoryReadmeRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `owner` of this provider.
  String get owner;

  /// The parameter `repo` of this provider.
  String get repo;
}

class _GetRepositoryReadmeProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with GetRepositoryReadmeRef {
  _GetRepositoryReadmeProviderElement(super.provider);

  @override
  String get owner => (origin as GetRepositoryReadmeProvider).owner;
  @override
  String get repo => (origin as GetRepositoryReadmeProvider).repo;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
