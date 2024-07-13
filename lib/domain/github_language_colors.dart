class GitHubLanguageColors {
  const GitHubLanguageColors({
    required this.name,
    required this.color,
  });
  final String name;
  final String? color;

  @override
  String toString() => 'GitHubLanguageColors(name: $name, color: $color)';
}
