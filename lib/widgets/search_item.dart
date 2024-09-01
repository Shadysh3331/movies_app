import 'package:flutter/material.dart';
import 'package:movie_app/models/SearchResponse.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/utils.dart';

class SearchItem extends StatelessWidget {
  SearchResults searchResults;

  SearchItem({required this.searchResults, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
        arguments: searchResults.id
        );
      },
      child: Row(
        children: [
          Image.network(
            "$imageUrl${searchResults.posterPath}",
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
                  searchResults.title ?? "",
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4,),
                Text(
                  searchResults.releaseDate != null && searchResults.releaseDate!.length >= 4
                      ? searchResults.releaseDate!.substring(0, 4)
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
