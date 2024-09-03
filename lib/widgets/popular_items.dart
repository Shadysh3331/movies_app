import 'package:flutter/material.dart';
import 'package:movie_app/firebase_functions.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/models/user_model.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/utils.dart';

class PopularItems extends StatefulWidget {
  UserModel model;
  Results results;

  PopularItems({required this.model, required this.results, super.key});

  @override
  State<PopularItems> createState() => _PopularItemsState();
}

class _PopularItemsState extends State<PopularItems> {
  void addToWatchlist(BuildContext context) {
    final userModel = UserModel(
      image: "$imageUrl${widget.results.posterPath}",
      title: widget.results.title ?? "",
      releaseDate: widget.results.releaseDate?.substring(0, 4) ?? "",
      isDone: false,
    );

    FirebaseFunctions().addUser(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
            arguments: widget.results.id);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$imageUrl${widget.results.backdropPath}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: Row(
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
                              "$imageUrl${widget.results.posterPath}"),
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
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130.0),
                      child: Text(widget.results.title ?? "",
                          style: Theme.of(context).textTheme.bodyMedium,),
                    ),
                    Text(widget.results.releaseDate?.substring(0, 4) ?? "",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
