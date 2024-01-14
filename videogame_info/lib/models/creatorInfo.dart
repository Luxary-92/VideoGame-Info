class CreatorInfo {
  final int id;
  final String name;
  final String slug;
  final String image;
  final List<String> positions;
  final List<int> games;

  CreatorInfo({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.positions,
    required this.games,
  });

  factory CreatorInfo.fromJson(Map<String, dynamic> json) {
    final List<dynamic> jsonPositions = json['positions'];
    final List<dynamic> jsonGames = json['games'];

    return CreatorInfo(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      positions: jsonPositions.map((position) => position['name'].toString()).toList(),
      games: jsonGames.map((game) => game['id'] as int).toList(),
    );
  }
}
