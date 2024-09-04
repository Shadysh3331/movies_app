import 'package:flutter/material.dart';
import 'package:movie_app/firebase_functions.dart';
import 'package:movie_app/models/MoreLikeThisResponse.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/utils.dart';

class MoreLikeThisItems extends StatefulWidget {
  UserModel model;
  MoreLikeThisResults moreLikeThisResults;
   MoreLikeThisItems({required this.model,required this.moreLikeThisResults,super.key});

  @override
  State<MoreLikeThisItems> createState() => _MoreLikeThisItemsState();
}

class _MoreLikeThisItemsState extends State<MoreLikeThisItems> {
  @override
  Widget build(BuildContext context) {
    void addToWatchlist(BuildContext context) {
      final userModel = UserModel(
        image: "$imageUrl${widget.moreLikeThisResults.posterPath}",
        title: widget.moreLikeThisResults.title ?? "",
        releaseDate: widget.moreLikeThisResults.releaseDate?.substring(0, 4) ?? "",
        isDone: false,
      );

      FirebaseFunctions().addUser(userModel);
    }
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
            arguments: widget.moreLikeThisResults.id
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
                          "$imageUrl${widget.moreLikeThisResults.posterPath}",
                          fit: BoxFit.fill,
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
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: MyThemeData.yellowColor, size: 15),
                      SizedBox(width: 4),
                      Text(
                        widget.moreLikeThisResults.voteAverage.toString().substring(0, 3),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    widget.moreLikeThisResults.title ?? "",
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
                    widget.moreLikeThisResults.releaseDate?.substring(0, 4) ?? "",
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
