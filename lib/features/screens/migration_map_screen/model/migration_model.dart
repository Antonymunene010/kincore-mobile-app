class MigrationModel {
  final String arrivalYear;
  final String reason;
  final List<MigrationMember> members;

  MigrationModel({required this.arrivalYear, required this.reason, required this.members});

  factory MigrationModel.fromJson(Map<String, dynamic> json) => MigrationModel(
    arrivalYear: json['arrival_year'] ?? '',
    reason: json['reason'] ?? '',
    members: (json['members'] as List? ?? []).map((e) => MigrationMember.fromJson(e)).toList(),
  );
}

class MigrationMember {
  final String name;
  final String relation;
  final String image;

  MigrationMember({required this.name, required this.relation, required this.image});

  factory MigrationMember.fromJson(Map<String, dynamic> json) => MigrationMember(
    name: json['name'] ?? '',
    relation: json['relation'] ?? '',
    image: json['image'] ?? '',
  );
}