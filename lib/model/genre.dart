class Genre {
  final int id;
  final String name;

  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  static List<Genre> parseList(List<dynamic> genreListJson) {
    List<Genre> genreList = new List<Genre>();

    if (genreListJson == null) {
      return genreList;
    }

    genreListJson.forEach((genreJson) {
      Genre genre = Genre.fromJson(genreJson);
      genreList.add(genre);
    });

    return genreList;
  }
}
