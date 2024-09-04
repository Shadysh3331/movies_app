import 'package:flutter/material.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/utils.dart';

class WatchlistItems extends StatelessWidget {
  UserModel movies;
   WatchlistItems({required this.movies,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "$imageUrl${movies.image}",
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
                movies.title.isNotEmpty ? movies.title : "No Title",
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4,),
              Text(
                movies.releaseDate.isNotEmpty
                    ? movies.releaseDate?.substring(0,4)??""
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
    );
  }
}
