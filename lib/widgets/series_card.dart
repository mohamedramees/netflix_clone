import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/top_rated_model.dart';
import 'package:netflix_clone/screens/movie_detail_screen.dart';

class TopRatedCard extends StatelessWidget {
  final Future<TopRatedMovieModel> future;
  final String headLineText;

  const TopRatedCard({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedMovieModel>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var seriesdata = snapshot.data!.results;
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                headLineText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: seriesdata.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                         onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailScreen(
                                  movieId: snapshot.data!.results[index].id,
                                ),
                              ),
                            );
                          },

                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              '$imageUrl${seriesdata[index].posterPath}',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ));
                  },
                ),
              )
            ]);
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
