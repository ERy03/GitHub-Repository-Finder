// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:github_repository_finder/models/github_repository_owner.dart';

class GitHubRepositoryModel {
  const GitHubRepositoryModel({
    required this.name,
    this.description,
    required this.htmlUrl,
    this.homepage,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.owner,
  });

  final String name;
  final String? description;
  final String htmlUrl;
  final String? homepage;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forksCount;
  final int openIssuesCount;
  final RepositoryOwner owner;

  GitHubRepositoryModel copyWith({
    String? name,
    String? description,
    String? htmlUrl,
    String? homepage,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    int? forksCount,
    int? openIssuesCount,
    RepositoryOwner? owner,
  }) {
    return GitHubRepositoryModel(
      name: name ?? this.name,
      description: description ?? this.description,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      homepage: homepage ?? this.homepage,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      watchersCount: watchersCount ?? this.watchersCount,
      language: language ?? this.language,
      forksCount: forksCount ?? this.forksCount,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'html_url': htmlUrl,
      'homepage': homepage,
      'stargazers_count': stargazersCount,
      'watchers_count': watchersCount,
      'language': language,
      'forks_count': forksCount,
      'open_issues_count': openIssuesCount,
      'owner': owner.toMap(),
    };
  }

  factory GitHubRepositoryModel.fromMap(Map<String, dynamic> map) {
    return GitHubRepositoryModel(
      name: map['name'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      htmlUrl: map['html_url'] as String,
      homepage: map['homepage'] != null ? map['homepage'] as String : null,
      stargazersCount: map['stargazers_count'] as int,
      watchersCount: map['watchers_count'] as int,
      language: map['language'] != null ? map['language'] as String : null,
      forksCount: map['forks_count'] as int,
      openIssuesCount: map['open_issues_count'] as int,
      owner: RepositoryOwner.fromMap(map['owner'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory GitHubRepositoryModel.fromJson(String source) =>
      GitHubRepositoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GitHubRepositoryModel(name: $name, description: $description, html_url: $htmlUrl, homepage: $homepage, stargazers_count: $stargazersCount, watchers_count: $watchersCount, language: $language, forks_count: $forksCount, open_issues_count: $openIssuesCount, owner: $owner)';
  }

  @override
  bool operator ==(covariant GitHubRepositoryModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.htmlUrl == htmlUrl &&
        other.homepage == homepage &&
        other.stargazersCount == stargazersCount &&
        other.watchersCount == watchersCount &&
        other.language == language &&
        other.forksCount == forksCount &&
        other.openIssuesCount == openIssuesCount &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        htmlUrl.hashCode ^
        homepage.hashCode ^
        stargazersCount.hashCode ^
        watchersCount.hashCode ^
        language.hashCode ^
        forksCount.hashCode ^
        openIssuesCount.hashCode ^
        owner.hashCode;
  }
}
