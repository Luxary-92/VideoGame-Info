class DetallesGame {
  int id;
  String name, description, released;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        released = json["released"];
}
