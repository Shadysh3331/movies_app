import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/utils.dart';
import 'package:movie_app/widgets/popular_items.dart';
import 'package:movie_app/widgets/top_rated_items.dart';
import 'package:movie_app/widgets/upcoming_items.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: ApiManager.getPopular(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          }
          var popular = snapshot.data?.results ?? [];
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: popular.length,
                  itemBuilder: (context, index, realIndex) {
                    UserModel userModel = UserModel(
                      image: "$imageUrl${popular[index].posterPath}",
                      title: popular[index].title ?? "",
                      releaseDate: popular[index].releaseDate?.substring(0, 4) ?? "",
                      isDone: false,
                    );
                    return PopularItems(results: popular[index],model: userModel,);
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height * .5,
                    autoPlay: true,
                  )),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                child: Container(
                  color: MyThemeData.secondaryColor,
                  child: FutureBuilder(
                    future: ApiManager.getUpcoming(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text("something went wrong"));
                      }
                      var upcoming = snapshot.data?.results ?? [];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Releases",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 12,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  UserModel userModel = UserModel(
                                    image: "$imageUrl${upcoming[index].posterPath}",
                                    title: upcoming[index].title ?? "",
                                    releaseDate: upcoming[index].releaseDate?.substring(0, 4) ?? "",
                                    isDone: false,
                                  );
                                  return UpcomingItems(
                                    upcomingResults: upcoming[index],
                                    model: userModel,
                                  );
                                },
                                itemCount: upcoming.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                child: Container(
                  color: MyThemeData.secondaryColor,
                  child: FutureBuilder(
                    future: ApiManager.getTopRated(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text("something went wrong"));
                      }
                      var topRated = snapshot.data?.results ?? [];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recommended",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    width: 12,
                                  );
                                },
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  UserModel userModel = UserModel(
                                    image: "$imageUrl${topRated[index].posterPath}",
                                    title: topRated[index].title ?? "",
                                    releaseDate: topRated[index].releaseDate?.substring(0, 4) ?? "",
                                    isDone: false,
                                  );
                                  return TopRatedItems(topRatedResults: topRated[index],model: userModel,);
                                },
                                itemCount: topRated.length,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 18,)
            ],
          );
        },
      ),
    );
  }
}
