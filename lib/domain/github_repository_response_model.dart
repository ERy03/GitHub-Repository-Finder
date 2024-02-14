// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:github_repository_finder/domain/github_repository_model.dart';

class GitHubRepositoryResponseModel {
  const GitHubRepositoryResponseModel({
    required this.totalCount,
    required this.items,
  });

  final int totalCount;
  final List<GitHubRepositoryModel> items;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'total_count': totalCount,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory GitHubRepositoryResponseModel.fromMap(Map<String, dynamic> map) {
    return GitHubRepositoryResponseModel(
      totalCount: map['total_count'] as int,
      items: List<GitHubRepositoryModel>.from(
        (map['items'] as List<dynamic>).map<GitHubRepositoryModel>(
          (x) => GitHubRepositoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory GitHubRepositoryResponseModel.fromJson(String source) =>
      GitHubRepositoryResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  GitHubRepositoryResponseModel copyWith({
    int? totalCount,
    List<GitHubRepositoryModel>? items,
  }) {
    return GitHubRepositoryResponseModel(
      totalCount: totalCount ?? this.totalCount,
      items: items ?? this.items,
    );
  }

  @override
  String toString() =>
      'GitHubRepositoryResponseModel(total_count: $totalCount, items: $items)';

  @override
  bool operator ==(covariant GitHubRepositoryResponseModel other) {
    if (identical(this, other)) return true;

    return other.totalCount == totalCount && listEquals(other.items, items);
  }

  @override
  int get hashCode => totalCount.hashCode ^ items.hashCode;
}
