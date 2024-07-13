// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RepositoryOwner {
  const RepositoryOwner({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  final String login;
  final String avatarUrl;
  final String htmlUrl;

  RepositoryOwner copyWith({
    String? login,
    String? avatarUrl,
    String? htmlUrl,
  }) {
    return RepositoryOwner(
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      htmlUrl: htmlUrl ?? this.htmlUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'html_url': htmlUrl,
    };
  }

  factory RepositoryOwner.fromMap(Map<String, dynamic> map) {
    return RepositoryOwner(
      login: map['login'] as String,
      avatarUrl: map['avatar_url'] as String,
      htmlUrl: map['html_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepositoryOwner.fromJson(String source) =>
      RepositoryOwner.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RepositoryOwner(login: $login, avatar_url: $avatarUrl, html_url: $htmlUrl)';

  @override
  bool operator ==(covariant RepositoryOwner other) {
    if (identical(this, other)) return true;

    return other.login == login &&
        other.avatarUrl == avatarUrl &&
        other.htmlUrl == htmlUrl;
  }

  @override
  int get hashCode => login.hashCode ^ avatarUrl.hashCode ^ htmlUrl.hashCode;
}
