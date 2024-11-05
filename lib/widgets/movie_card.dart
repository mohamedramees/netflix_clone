import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Future<MovieModel> future;
  final String headLineText;

  const MovieCard({super.key, required this.future, required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data?.results;
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
                  itemCount: data!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: () {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(
                                            movieId:data[index].id
                                            ),
                                            ),
                                            );

                          },
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              '$imageUrl${data[index].posterPath}',
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
