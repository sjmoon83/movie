import 'package:flutter/material.dart';

class DetailScreenPop extends StatelessWidget {
  const DetailScreenPop({
    Key? key,
    required this.id,
    required this.backdropPath,
    required this.posterPath,
    required this.genreIds,
    required this.overview,
    required this.title,
    required this.voteAverage,
  }) : super(key: key);

  static const String postUrl = "https://image.tmdb.org/t/p/w500";

  final String backdropPath, posterPath, title, overview;
  final int id;
  final num voteAverage;
  final List genreIds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('$postUrl$posterPath'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios_sharp),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 5),
                const Text(
                  'Back to List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 300,
            left: 10,
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '$voteAverage / 10.0',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Storyline',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  overview,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
