import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/tabs/browse.dart';
import 'package:movie_app/tabs/home.dart';
import 'package:movie_app/tabs/search.dart';
import 'package:movie_app/tabs/whatchlist.dart';

class HomeScreen extends StatefulWidget {
  static const String routName="home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex:selectedIndex,
          onTap: (value) {
            selectedIndex=value;
            setState(() {

            });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "SEARCH"),
        BottomNavigationBarItem(icon: Icon(Icons.video_library),label: "BROWSE"),
        BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark),label: "WHATCHLIST"),
      ],
     ),
      body: tabs[selectedIndex],
    );
  }

List<Widget>tabs=[
  Home(),
  Search(),
  Browse(),
  Whatchlist()
];
}
