import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constatns.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/home/home-tap/movie_detailed_screen.dart';
import 'package:movies_app/model/movie_recommendation_mode.dart';

class MoviePopular extends StatelessWidget {
  final Future<MovieRecommendationsModel> future;

  final String headlineText;
  const MoviePopular({
    super.key,
    required this.future,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkGrayColor,
      child: FutureBuilder<MovieRecommendationsModel>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data?.results;
              return Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        headlineText,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                                      builder: (context) => MovieDetailScreen(
                                        movieId: data[index].id,
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
          }),
    );
  }
}