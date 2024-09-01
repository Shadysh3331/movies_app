import 'package:flutter/material.dart';
import 'package:movie_app/models/MovieDiscoverResponse.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/utils.dart';

class MovieDiscoverItems extends StatelessWidget {
  DiscoverResults discoverResults;
   MovieDiscoverItems({required this.discoverResults,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
        arguments: discoverResults.id
        );
      },
      child: Row(
        children: [
          Image.network(
            "$imageUrl${discoverResults.posterPath}",
            height: MediaQuery.of(context).size.height * .2,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  discoverResults.title ?? "",
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4,),
                Text(
                  discoverResults.releaseDate != null && discoverResults.releaseDate!.length >= 4
                      ? discoverResults.releaseDate!.substring(0, 4)
                      : "No Date",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
