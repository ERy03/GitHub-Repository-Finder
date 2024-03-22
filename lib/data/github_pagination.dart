class GitHubPagination {
  GitHubPagination({
    required this.page,
    required this.query,
  });
  final int page;
  final String query;

  @override
  String toString() => 'GitHubPagination(page: $page, query: $query)';

  @override
  bool operator ==(covariant GitHubPagination other) {
    if (identical(this, other)) return true;

    return other.page == page && other.query == query;
  }

  @override
  int get hashCode => page.hashCode ^ query.hashCode;
}
