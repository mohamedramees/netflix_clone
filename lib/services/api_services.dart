import 'dart:convert';
import 'dart:developer';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_detail_model.dart';
import 'package:netflix_clone/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/models/movie_recommendation_model.dart';
import 'package:netflix_clone/models/now_playing_model.dart';
import 'package:netflix_clone/models/popular_movie_model.dart';
import 'package:netflix_clone/models/search_model.dart';
import 'package:netflix_clone/models/top_rated_model.dart';
import 'package:netflix_clone/models/trending_movie_model.dart';

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {

//^ UPCOMING MOVIE MODEL HOME

  Future<MovieModel> getMovieModel() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success upcoming Movies");

      return MovieModel.fromJson(jsonDecode(response.body));
    }else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load upcoming movies: ${response.statusCode}.");
  }
  }

//^ TRENDING MOVIE MODEL( CAROUSEL ) HOME

 Future<TrendingMovieModel> getTrendingModel() async {
  endPoint = "trending/movie/day";
  final url = "$baseUrl$endPoint$key";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    log("Success: Trending movies loaded");
    return TrendingMovieModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load trending movies: ${response.statusCode}");
  }
}


//^ TOP RATED MODEL (HOME)

Future<TopRatedMovieModel> getTopRatedMovieModel() async {
  endPoint = "movie/top_rated";
  final url = "$baseUrl$endPoint$key";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    log("Success: Top-rated movies loaded");
    return TopRatedMovieModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load top-rated movies: ${response.statusCode}");
  }
}



  //^ NOW PLAYING MODEL (HOME)

  Future<NowPlayingModel> getNowPlayingModel() async {
  endPoint = "movie/now_playing";
  final url = "$baseUrl$endPoint$key";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    log("Success: Now Playing movies loaded");
    return NowPlayingModel.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load now-playing movies: ${response.statusCode}");
  }
}


//^ SEARCH MOVIE MODEL SEARCH

  Future<SearchModel> getSearchedMovie(String searchText) async {
    endPoint = 'search/movie?query=$searchText';
    final url = '$baseUrl$endPoint';
    print(url);
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NTAyYjhjMDMxYzc5NzkwZmU1YzBiNGY5NGZkNzcwZCIsInN1YiI6IjYzMmMxYjAyYmE0ODAyMDA4MTcyNjM5NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N1SoB26LWgsA33c-5X0DT5haVOD4CfWfRhwpDu9eGkc'
    });
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log('success search Model');
      return SearchModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  search movie ');
  }


  //^ MOVIE DETAILS MODEL

  Future<MovieDetailModel> getMovieDetails(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('success Details Model');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
   else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load now-playing movies: ${response.statusCode}");
  }
  }


  //^ MOVIE POPULAR MODEL(Searc Recommendation)

  Future<PopularMoviesModel> getPopularMoviesModel() async {
    endPoint = "movie/popular";
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success  Popular Movies" );

      return PopularMoviesModel.fromJson(jsonDecode(response.body));
    }

    else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load now-playing movies: ${response.statusCode}");
  }
  }


  //^ MOVIE RECOMMENDATION MODEL

  Future<MovieRecommendationsModel> getMovieRecommendation(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = "$baseUrl$endPoint$key";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log("success  Movie Recommendations");

      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }else if (response.statusCode == 400) {
    throw Exception("Bad Request");
  } else if (response.statusCode == 401) {
    throw Exception("Unauthorized");
  } else if (response.statusCode == 403) {
    throw Exception("Forbidden");
  } else if (response.statusCode == 404) {
    throw Exception("Not Found");
  } else if (response.statusCode == 500) {
    throw Exception("Internal Server Error");
  } else if (response.statusCode == 503) {
    throw Exception("Service Unavailable");
  } else {
    throw Exception("Failed to load now-playing movies: ${response.statusCode}");
  }
  }




}
