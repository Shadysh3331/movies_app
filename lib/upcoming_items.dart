import 'package:flutter/material.dart';
import 'package:movie_app/models/UpcomingResponse.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/utils.dart';

class UpcomingItems extends StatelessWidget {
UpcomingResults upcomingResults;
   UpcomingItems({required this.upcomingResults,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.45,
            height: MediaQuery.of(context).size.height*.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage("$imageUrl${upcomingResults.posterPath}"),
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
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
