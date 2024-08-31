import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/MovieDetailsResponse.dart';
import 'package:movie_app/widgets/movie_details_items.dart';
import 'package:movie_app/widgets/more_like_this_items.dart';
import 'package:movie_app/my_theme_data.dart';

class MovieDetails extends StatelessWidget {
  static const String routName = "details";
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var movieId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<MovieDetailsResponse>(
          future: ApiManager.getMovieDetails(movieId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text("something went wrong"));
            }
            var details = snapshot.data!;
            return Text(details.title ?? "");
          },
        ),
      ),
      body: FutureBuilder<MovieDetailsResponse>(
        future: ApiManager.getMovieDetails(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          }
          var details = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                MovieDetailsItems(movieDetailsResponse: details),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .55,
                  child: Container(
                    color: MyThemeData.secondaryColor,
                    child: FutureBuilder(
                      future: ApiManager.getMoreLikeThis(movieId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(child: Text("something went wrong"));
                        }
                        var moreLikeThisItems = snapshot.data?.results??[];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "More Like This",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return SizedBox(width: 12);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return MoreLikeThisItems(moreLikeThisResults: moreLikeThisItems[index]);
                                    },
                                    itemCount: moreLikeThisItems.length,
                                  ),
                                ),
                              ],
                            ),
                          );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
