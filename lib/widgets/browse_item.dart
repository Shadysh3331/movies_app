import 'package:flutter/material.dart';
import 'package:movie_app/models/BrowseResponse.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/screens/movie_discover.dart';

class BrowseItem extends StatelessWidget {
  Genres genres;

  BrowseItem({required this.genres, super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> genreImages = {
      'Action': 'assets/images/action.jpg',
      'Adventure': 'assets/images/adventure.webp',
      'Drama': 'assets/images/drama.jpg',
      'Animation': 'assets/images/animation.jpeg',
      'Crime': 'assets/images/crime.jpeg',
      'Fantasy': 'assets/images/fantasy.jpg',
      'Science Fiction': 'assets/images/sci-fi.jpeg',
    };

    String imagePath = genreImages[genres.name] ?? 'assets/images/category.jpg';
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDiscover.routName,
            arguments: Genre(genres.id,genres.name));
      },
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Text(
              genres.name ?? "",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
