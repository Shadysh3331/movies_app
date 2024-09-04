import 'package:flutter/material.dart';
import 'package:movie_app/firebase_functions.dart';
import 'package:movie_app/models/UpcomingResponse.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/utils.dart';

import '../screens/movie_details.dart';

class UpcomingItems extends StatefulWidget {
  UserModel model;
  UpcomingResults upcomingResults;
   UpcomingItems({required this.model,required this.upcomingResults,super.key});

  @override
  State<UpcomingItems> createState() => _UpcomingItemsState();
}

class _UpcomingItemsState extends State<UpcomingItems> {
  @override
  Widget build(BuildContext context) {
    void addToWatchlist(BuildContext context) {
      final userModel = UserModel(
        image: "$imageUrl${widget.upcomingResults.posterPath}",
        title: widget.upcomingResults.title ?? "",
        releaseDate: widget.upcomingResults.releaseDate?.substring(0, 4) ?? "",
        isDone: false,
      );

      FirebaseFunctions().addUser(userModel);
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
            arguments:widget.upcomingResults.id
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*.45,
              height: MediaQuery.of(context).size.height*.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage("$imageUrl${widget.upcomingResults.posterPath}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 40,
                  width: 40,
                  color: widget.model.isDone ? MyThemeData.yellowColor : Color(0xff514F4F),
                  child: IconButton(
                      iconSize: 25,
                      color: Colors.white,
                      onPressed: () {
                        widget.model.isDone = true;
                        addToWatchlist(context);
                        setState(() {

                        });
                      },
                      icon: widget.model.isDone
                          ? Icon(
                        Icons.done,
                      )
                          : Icon(
                        Icons.add,
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
