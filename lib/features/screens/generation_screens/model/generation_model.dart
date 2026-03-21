class GenerationModel {
  final String id;
  final String name;
  final String lifeSpan;
  final String role;
  final String image;
  final List<FamilyMember> members;

  GenerationModel({
    required this.id, required this.name, required this.lifeSpan,
    required this.role, required this.image, required this.members,
  });

  factory GenerationModel.fromJson(Map<String, dynamic> json) => GenerationModel(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    lifeSpan: json['life_span'] ?? '',
    role: json['role'] ?? '',
    image: json['image'] ?? '',
    members: (json['members'] as List? ?? []).map((e) => FamilyMember.fromJson(e)).toList(),
  );
}

class FamilyMember {
  final String name;
  final String relation;
  final String image;
  final int generationLevel;

  FamilyMember({
    required this.name,
    required this.relation,
    required this.image,
    required this.generationLevel
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) => FamilyMember(
    name: json['name'] ?? '',
    relation: json['relation'] ?? '',
    image: json['image'] ?? '',
    generationLevel: json['gen_level'] ?? 1,
  );
}