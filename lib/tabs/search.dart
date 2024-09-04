import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/search_tab.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.secondaryColor,
        title: Text("Movie App"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showSearch(context: context, delegate: SearchTab());
          }, icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/movie_icon.png")),
          SizedBox(height: 6,),
          Text("Search For Movies")
        ],
      ),
    );
  }
}
