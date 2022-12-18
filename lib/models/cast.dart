List<Cast> castMembersToList(List<dynamic> data) =>
    data.map((json) => Cast.fromJson(json)).toList();

class Cast {
  final String image;
  final String characterName;
  final String name;
  Cast({required this.image, required this.characterName, required this.name});
  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        image: json['profile_path'],
        characterName: json['character'],
        name: json['name'],
      );
}
