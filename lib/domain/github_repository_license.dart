// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RepositoryLicense {
  RepositoryLicense({
    required this.spdxId,
  });
  final String spdxId;

  RepositoryLicense copyWith({
    String? spdxId,
  }) {
    return RepositoryLicense(
      spdxId: spdxId ?? this.spdxId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spdx_id': spdxId,
    };
  }

  factory RepositoryLicense.fromMap(Map<String, dynamic> map) {
    return RepositoryLicense(
      spdxId: map['spdx_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RepositoryLicense.fromJson(String source) =>
      RepositoryLicense.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RepositoryLicense(spdx_id: $spdxId)';

  @override
  bool operator ==(covariant RepositoryLicense other) {
    if (identical(this, other)) return true;

    return other.spdxId == spdxId;
  }

  @override
  int get hashCode => spdxId.hashCode;
}
