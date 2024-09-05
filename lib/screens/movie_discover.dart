import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/widgets/movie_discover_items.dart';

class MovieDiscover extends StatelessWidget {
  static const String routName = "discover";

  const MovieDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Genre;
    int? genreId = args.genreId;
    String? genreName = args.genreName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies From $genreName"),
      ),
      body: FutureBuilder(
        future: ApiManager.getMovieDiscover(genreId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          }
          var discover = snapshot.data?.results ?? [];
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(thickness: 2,color: Color(0xff707070),);
            },
            itemBuilder: (context, index) {
            return MovieDiscoverItems(discoverResults: discover[index]);
          }, itemCount: discover.length,);
        },
      ),
    );
  }
}
