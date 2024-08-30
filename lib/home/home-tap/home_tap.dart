import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/home/widgets/custom_carousel.dart';
import 'package:movies_app/home/widgets/upcoming_movie_card_widget.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/model/tv_series_model.dart';
import 'package:movies_app/model/movie_recommendation_mode.dart';
import 'package:movies_app/home/widgets/populor.dart';




class HomeTab extends StatefulWidget {

  @override
  State<HomeTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeTab> {
  ApiServices apiServices = ApiServices();

  late Future<MovieModel> upcomingFuture;
  late Future<MovieRecommendationsModel> popularApi;
  late Future<TvSeriesModel> topRatedShows;

  @override
  void initState() {
    upcomingFuture = apiServices.getUpcomingMovies();
    topRatedShows = apiServices.getTopRatedSeries();
    popularApi= apiServices.getPopularMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<TvSeriesModel>(
              future: topRatedShows,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!);
                }
                return const SizedBox();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: MoviePopular(
                future: popularApi,
                headlineText: 'Popular',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: UpcomingMovieCard(
                future: upcomingFuture,
                headlineText: 'Upcoming Movies',
              ),
            ),
          ],
        ),
      ),
    );
  }
}