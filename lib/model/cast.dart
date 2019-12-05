class Cast {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  Cast({
    this.id,
    this.name,
    this.character,
    this.profilePath,
  });

  Cast.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        character = json['character'],
        profilePath = json['profile_path'];

  static List<Cast> parseList(Map<String, dynamic> json) {
    List<Cast> castList = new List<Cast>();

    print('hey cast');
    print(json);

    if (json['cast'] == null) {
      return castList;
    }

    var results = json['cast'] as List;

    results.forEach((castJson) {
      Cast cast = Cast.fromJson(castJson);
      castList.add(cast);
    });

    return castList;
  }
}
