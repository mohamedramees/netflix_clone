import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/screens/movie_detail_screen.dart';
import 'package:netflix_clone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searcController = TextEditingController();
  ApiServices apiServices = ApiServices();
  late Future<PopularMoviesModel> popularMovies;

  SearchModel? searchModel;

  void search(String query) {
    apiServices.getSearchedMovie(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    popularMovies = apiServices.getPopularMoviesModel();
    super.initState();
  }

  @override
  void dispose() {
    searcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                controller: searcController,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                  decoration: TextDecoration.none,
                ),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    search(searcController.text);
                  }
                },
              ),
            ),
            searcController.text.isEmpty
                ? FutureBuilder(
                    future: popularMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var data = snapshot.data?.results;
                        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Top Searches",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MovieDetailScreen(
                                            movieId: data[index].id,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            '$imageUrl${data[index].posterPath}',
                                            fit: BoxFit.fitHeight,
                                          ),
                                          const SizedBox(width: 20),
                                          SizedBox(
                                            width: 240,
                                            child: Text(
                                              data[index].title,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          )
                        ]);
                      } else {
                        return const SizedBox.shrink();
                      }
                    })
                : searchModel == null
                    ? const SizedBox.shrink()
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: searchModel?.results.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, mainAxisSpacing: 15, crossAxisSpacing: 5, childAspectRatio: 1.2 / 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailScreen(movieId: searchModel!.results[index].id)));
                            },
                            child: Column(
                              children: [
                                searchModel!.results[index].backdropPath == null
                                    ? Image.asset(
                                        "assets/netflix.png",
                                        height: 165,
                                      )
                                    : CachedNetworkImage(
                                        imageUrl: '${imageUrl}${searchModel!.results[index].backdropPath}',
                                        height: 170,
                                      ),
                                SizedBox(
                                    width: 100,
                                    child: Text(
                                      searchModel!.results[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ))
                              ],
                            ),
                          );
                        })
          ]),
        ),
      ),
    );
  }
}
