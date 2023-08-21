import 'package:flutter/material.dart';
import 'package:webtoon02/models/pop_model.dart';
import 'package:webtoon02/services/api_service.dart';
import 'package:webtoon02/widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopModel>> populars = ApiServicePop.getPopular();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: populars,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'Popular Movies',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: popList(snapshot),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView popList(AsyncSnapshot<List<PopModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        print(index);
        var popular = snapshot.data![index];
        return Popular(
          id: popular.id,
          backdropPath: popular.backdropPath,
          posterPath: popular.posterPath,
          genreIds: popular.genreIds,
          overview: popular.overview,
          title: popular.title,
          voteAverage: popular.voteAverage,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
