import 'package:flutter/material.dart';
import 'package:movie_app/models/MovieDetailsResponse.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/utils.dart';

class MovieDetailsItems extends StatelessWidget {
  MovieDetailsResponse movieDetailsResponse;

  MovieDetailsItems({required this.movieDetailsResponse, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network("$imageUrl${movieDetailsResponse.backdropPath}"),
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*.77,
                    child: Text(
                      movieDetailsResponse.title ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: MyThemeData.yellowColor, size: 18),
                  SizedBox(width: 4),
                  Text(movieDetailsResponse.voteAverage.toString().substring(0, 3),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                movieDetailsResponse.releaseDate?.substring(0, 4) ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 129,
                        height: 199,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                "$imageUrl${movieDetailsResponse.posterPath}"),
                            fit: BoxFit.cover,
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
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: movieDetailsResponse.genres!.map((genre) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Color(0xff514F4F)),
                              ),
                              child: Text(
                                genre.name ?? "",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 10),
                        Text(
                          movieDetailsResponse.overview ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 13),

                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
