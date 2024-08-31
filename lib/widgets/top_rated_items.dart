import 'package:flutter/material.dart';
import 'package:movie_app/models/TopRatedResponse.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/utils.dart';

import '../screens/movie_details.dart';

class TopRatedItems extends StatelessWidget {
   TopRatedResults topRatedResults;

  TopRatedItems({required this.topRatedResults, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
            arguments:topRatedResults.id
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width*.5,
          height: MediaQuery.of(context).size.height*.3,
          child: Card(
            color: Color(0xff343534),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*.5,
                      height: MediaQuery.of(context).size.height*.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          "$imageUrl${topRatedResults.posterPath}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.all(6),
                          color: Color(0xff514F4F),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: MyThemeData.yellowColor, size: 15),
                      SizedBox(width: 4),
                      Text(
                        topRatedResults.voteAverage.toString().substring(0, 3),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    topRatedResults.title ?? "",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    topRatedResults.releaseDate?.substring(0, 4) ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
