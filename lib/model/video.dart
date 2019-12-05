class Video {
  final String site;
  final String type;
  final String key;
  final String name;

  Video({this.site, this.type, this.key, this.name});

  Video.fromJson(Map<String, dynamic> json)
      : site = json['site'],
        type = json['type'],
        key = json['key'],
        name = json['name'];

  static List<Video> parseList(Map<String, dynamic> json) {
    List<Video> videoList = new List<Video>();

    print('videos');
    print(json);

    if (json['results'] == null) {
      return videoList;
    }

    var results = json['results'] as List;

    results.forEach((videoJson) {
      Video video = Video.fromJson(videoJson);
      videoList.add(video);
    });

    return videoList;
  }
}
