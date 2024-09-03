import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/models/SearchResponse.dart';
import 'package:movie_app/utils.dart';
import 'package:movie_app/widgets/search_item.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query='';
        showSuggestions(context);
      }, icon: Icon(Icons.clear),iconSize: 30,),
     IconButton(onPressed: () {
       showResults(context);
     }, icon: Icon(Icons.search),iconSize: 30,),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: Icon(Icons.arrow_back),iconSize: 30,);
  }

  @override
  Widget buildResults(BuildContext context) {
  return  buildSearchData();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     if(query.isEmpty){
     return Center(child: Text("Please enter text to search"));
    }else {
       return buildSearchData();
     }
  }
  Widget buildSearchData(){
    return FutureBuilder<SearchResponse>(
      future: ApiManager.getSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } if (snapshot.hasError) {
          return Center(child: Text("something went wrong"));
        }

        var search = snapshot.data?.results??[];
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(thickness: 2,color: Color(0xff707070),);
          },
          itemCount: search.length,
          itemBuilder: (context, index) {
            return SearchItem(searchResults: search[index]);
          },
        );

      },
    );
  }
}