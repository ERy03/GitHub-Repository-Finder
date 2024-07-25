// ignore_for_file: public_member_api_docs, sort_constructors_first
class GitHubLanguageColors {
  const GitHubLanguageColors({
    required this.name,
    required this.color,
  });
  final String name;
  final String? color;

  @override
  String toString() => 'GitHubLanguageColors(name: $name, color: $color)';

  @override
  bool operator ==(covariant GitHubLanguageColors other) {
    if (identical(this, other)) return true;

    return other.name == name && other.color == color;
  }

  @override
  int get hashCode => name.hashCode ^ color.hashCode;
}
