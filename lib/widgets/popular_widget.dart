import 'package:flutter/material.dart';
import 'package:webtoon02/screens/detail_screen.dart';

class Popular extends StatelessWidget {
  const Popular({
    super.key,
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.genreIds,
    required this.overview,
    required this.title,
    required this.voteAverage,
  });

  final String backdropPath, posterPath, title, overview;
  final int id;
  final num voteAverage;
  final List genreIds;

  static const String postUrl = "https://image.tmdb.org/t/p/w500";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreenPop(
              id: id,
              backdropPath: backdropPath,
              posterPath: posterPath,
              genreIds: genreIds,
              overview: overview,
              title: title,
              voteAverage: voteAverage,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      offset: const Offset(5, 5),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ]),
              width: 300,
              child: Image.network(
                '$postUrl$backdropPath',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
