import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:netflix_clone/models/now_playing_model.dart';
import 'package:netflix_clone/models/top_rated_model.dart';
import 'package:netflix_clone/models/trending_movie_model.dart';
import 'package:netflix_clone/screens/search_screen.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/carousel_home.dart';
import 'package:netflix_clone/widgets/now_playing_home_card.dart.dart';
import 'package:netflix_clone/widgets/movie_card.dart';
import 'package:netflix_clone/widgets/series_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieModel> movieModelFuture;
  late Future<TrendingMovieModel> trendingModelFuture;
  late Future<TopRatedMovieModel> topRatedFuture;
  late Future<NowPlayingModel> nowPlayingFuture;

  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    movieModelFuture = apiServices.getMovieModel();
    trendingModelFuture = apiServices.getTrendingModel();
    topRatedFuture = apiServices.getTopRatedMovieModel();
    nowPlayingFuture = apiServices.getNowPlayingModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          width: 120,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
              },
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              'assets/avataaar.avif',
              height: 27,
              width: 27,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<TrendingMovieModel>(
              future: trendingModelFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.results.isNotEmpty) {
                  return CarouselHome(data: snapshot.data!);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(
              height: 220,
              child: MovieCard(future: movieModelFuture, headLineText: 'Upcoming Movies'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: TopRatedCard(future: topRatedFuture, headLineText: 'Top Rated Movies'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 220,
              child: NowPlayingHomeCard(future: nowPlayingFuture, headLineText: 'Now Playing'),
            ),
          ],
        ),
      ),
    );
  }
}
