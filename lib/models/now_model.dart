class NowModel {
  final String backdropPath, posterPath, title, overview;
  final num voteAverage;
  final int id;
  final List genreIds;

  NowModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        backdropPath = json['backdrop_path'],
        posterPath = json['poster_path'],
        title = json['title'],
        voteAverage = json['vote_average'],
        overview = json['overview'],
        genreIds = json['genre_ids'];
}
