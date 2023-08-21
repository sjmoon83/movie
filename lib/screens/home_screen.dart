import 'package:flutter/material.dart';
import 'package:webtoon02/models/now_model.dart';
import 'package:webtoon02/models/pop_model.dart';
import 'package:webtoon02/models/soon_model.dart';
import 'package:webtoon02/services/api_service.dart';
import 'package:webtoon02/services/api_service_n.dart';
import 'package:webtoon02/services/api_service_s.dart';
import 'package:webtoon02/widgets/now_widget.dart';
import 'package:webtoon02/widgets/popular_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<PopModel>> populars = ApiServicePop.getPopular();
  final Future<List<NowModel>> nows = ApiServiceNow.getNowPlay();
  final Future<List<SoonModel>> soons = ApiServiceSoon.getSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
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
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.5,,
            child: FutureBuilder(
              future: nows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Text(
                          'Now in Cinemas',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w800),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: nowList(snapshot),
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListView popList(AsyncSnapshot<List<PopModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
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

  ListView nowList(AsyncSnapshot<List<NowModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      itemBuilder: (context, index) {
        var nowPlay = snapshot.data![index];
        return NowPlay(
          id: nowPlay.id,
          backdropPath: nowPlay.backdropPath,
          posterPath: nowPlay.posterPath,
          genreIds: nowPlay.genreIds,
          overview: nowPlay.overview,
          title: nowPlay.title,
          voteAverage: nowPlay.voteAverage,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 10,
      ),
    );
  }
}
