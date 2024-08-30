import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/api_constatns.dart';
import 'package:movies_app/model/category.dart';
import 'dart:developer';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/model/movie_recommendation_mode.dart';
import 'package:movies_app/model/tv_series_model.dart';



const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

class ApiServices {
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





}