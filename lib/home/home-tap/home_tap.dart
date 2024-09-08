import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/app_colors.dart';
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
  ApiManager  apiManager = ApiManager ();

  late Future<MovieModel> upcomingFuture;
  late Future<MovieRecommendationsModel> popularApi;
  late Future<TvSeriesModel> topRatedShows;

  @override
  void initState() {
    upcomingFuture = apiManager.getUpcomingMovies();
    topRatedShows = apiManager.getTopRatedSeries();
    popularApi= apiManager.getPopularMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
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

              SizedBox(
                height:  MediaQuery.of(context).size.height*0.29,
                child: UpcomingMovieCard(
                  future: upcomingFuture,
                  headlineText: 'New Releases ',
                ),
              ),


              SizedBox(
                height: MediaQuery.of(context).size.height*0.29,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MoviePopular(
                    future: popularApi,
                    headlineText:'Recomended',

                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}