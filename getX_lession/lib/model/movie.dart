class Movie {
  bool? adult;
  String? backdrop_path;
  List<int>? genre_ids;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  Movie(
      {
    required this.adult,
    required  this.backdrop_path,
    required  this.genre_ids,
    required  this.id,
    required  this.original_language,
    required  this.original_title,
    required  this.overview,
    required  this.popularity,
    required  this.poster_path,
    required  this.release_date,
    required  this.title,
    required  this.video,
    required  this.vote_average,
    required  this.vote_count});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdrop_path = json['backdrop_path'];
    genre_ids = json['genre_ids'].cast<int>();
    id = json['id'];
    original_language = json['original_language'];
    original_title = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    release_date = json['release_date'];
    title = json['title'];
    video = json['video'];
    vote_average = json['vote_average'] * 0.1;
    vote_count = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = adult;
    data['backdrop_path'] = backdrop_path;
    data['genre_ids'] = genre_ids;
    data['id'] = id;
    data['original_language'] = original_language;
    data['original_title'] = original_title;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = poster_path;
    data['release_date'] = release_date;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = vote_average;
    data['vote_count'] = vote_count;
    return data;
  }
}
