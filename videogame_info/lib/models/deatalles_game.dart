class DetallesGame {
  int id;
  String name, description, released;
  int metacritic;
  String image, website;

  DetallesGame.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        description = json["description"],
        released = json["released"],
        metacritic = json["metacritic"],
        image = json["image"],
        website = json["website"];
}
