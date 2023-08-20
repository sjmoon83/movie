class PopModel {
  final String backdropPath, title, overview;
  final Object voteAverage;
  final List genreIds;

  PopModel.fromJson(Map<String, dynamic> json)
      : backdropPath = json['backdrop_path'],
        title = json['title'],
        voteAverage = json['vote_average'],
        overview = json['overview'],
        genreIds = json['genre_ids'];
}
