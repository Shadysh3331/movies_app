import 'package:flutter/material.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/utils.dart';

class PopularItems extends StatelessWidget {
  Results results;

  PopularItems({required this.results, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetails.routName,
            arguments:results.id
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$imageUrl${results.backdropPath}"),
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
                          image: NetworkImage("$imageUrl${results.posterPath}"),
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
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 130.0),
                      child: Text(results.title ?? "", style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Text(results.releaseDate?.substring(0, 4) ?? "", style: Theme.of(context).textTheme.bodySmall),
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
