import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constatns.dart';
import 'package:movies_app/model/category.dart';
import 'package:movies_app/model/movie_detail_model.dart';
import 'dart:developer';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/model/movie_recommendation_mode.dart';
import 'package:movies_app/model/search.dart';
import 'package:movies_app/model/tv_series_model.dart';



const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

class ApiManager {
 Future<MovieModel> getUpcomingMovies() async {
  endPoint = 'movie/upcoming';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   log('success');
   return MovieModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load upcoming movies');
 }

 Future<MovieDetailModel> getMovieDetail(int movieId) async {
  endPoint = 'movie/$movieId';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   log('success');
   return MovieDetailModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load  movie details');
 }

 Future<MovieRecommendationsModel> getPopularMovies() async {
  endPoint = 'movie/popular';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url), headers: {});
  if (response.statusCode == 200) {
   log('success');
   return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load now playing movies');
 }

 Future<TvSeriesModel> getTopRatedSeries() async {
  endPoint = 'tv/1396/recommendations';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   log('success');
   return TvSeriesModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load top rated series');
 }


 Future<category> getCategory() async {
  endPoint = 'genre/movie/list';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   log('success');

   return category.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load top rated series');
 }
 Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
  endPoint = 'movie/$movieId/recommendations';
  final url = '$baseUrl$endPoint$key';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
   log('success');
   return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load  movie details');
 }


 Future<Search> getSearchedMovie(String searchText) async {
  endPoint = 'search/movie?query=$searchText';
  final url = '$baseUrl$endPoint';

  print('search url is $url');
  final response = await http.get(Uri.parse(url),
      headers:{'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwODc1MmJjNzhiNDJjYmVlYWFmODlkZWE5N2E3MDViNSIsIm5iZiI6MTcyNDk5MDY0OC4zNTA3MDEsInN1YiI6IjY2Y2Y5ZjYxNWNkZGNiY2Q3OGJkODg3MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jlEsyJtu68xMRXdDxHp-bkb5xvqV9XGz30CklmO3Frk'});
  if (response.statusCode == 200) {
   log('success');
   return Search.fromJson(jsonDecode(response.body));
  }
  throw Exception('failed to load searched movie ');
 }


}