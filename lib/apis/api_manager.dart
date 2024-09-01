import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/BrowseResponse.dart';
import 'package:movie_app/models/MoreLikeThisResponse.dart';
import 'package:movie_app/models/MovieDetailsResponse.dart';
import 'package:movie_app/models/MovieDiscoverResponse.dart';
import 'package:movie_app/models/PopularResponse.dart';
import 'package:movie_app/models/SearchResponse.dart';
import 'package:movie_app/models/TopRatedResponse.dart';
import 'package:movie_app/models/UpcomingResponse.dart';

class ApiManager{

//https://api.themoviedb.org/3/movie/popular?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
static Future<PopularResponse> getPopular()async{
  Uri url=Uri.https("api.themoviedb.org","/3/movie/popular",{
    "api_key":"22d1f1116a2c8e99422e87fcedacb1e7"
  });
  http.Response response=await http.get(url);
  Map<String,dynamic> jsonFormat=jsonDecode(response.body);
  PopularResponse popularResponse=PopularResponse.fromJson(jsonFormat);
  return popularResponse;
}

//https://api.themoviedb.org/3/movie/upcoming?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<UpcomingResponse> getUpcoming()async{
    Uri url=Uri.https("api.themoviedb.org","/3/movie/upcoming",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    UpcomingResponse upcomingResponse=UpcomingResponse.fromJson(jsonFormat);
    return upcomingResponse;
  }

  //https://api.themoviedb.org/3/movie/top_rated?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<TopRatedResponse> getTopRated()async{
    Uri url=Uri.https("api.themoviedb.org","/3/movie/top_rated",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    TopRatedResponse topRatedResponse=TopRatedResponse.fromJson(jsonFormat);
    return topRatedResponse;
  }
  //https://api.themoviedb.org/3/movie/671?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<MovieDetailsResponse> getMovieDetails(int movieId)async{
    Uri url=Uri.https("api.themoviedb.org","/3/movie/$movieId",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    MovieDetailsResponse movieDetailsResponse=MovieDetailsResponse.fromJson(jsonFormat);
    return movieDetailsResponse;
  }

  // https://api.themoviedb.org/3/movie/{movie_id}/similar?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<MoreLikeThisResponse> getMoreLikeThis(int movieId)async{
    Uri url=Uri.https("api.themoviedb.org","/3/movie/$movieId/similar",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    MoreLikeThisResponse moreLikeThisResponse=MoreLikeThisResponse.fromJson(jsonFormat);
    return moreLikeThisResponse;
  }

  // https://api.themoviedb.org/3/search/movie?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<SearchResponse> getSearch(String query)async{
    Uri url=Uri.https("api.themoviedb.org","/3/search/movie",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
      "query":query
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    SearchResponse searchResponse=SearchResponse.fromJson(jsonFormat);
    return searchResponse;
  }

  // https://api.themoviedb.org/3/genre/movie/list?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<BrowseResponse> getCategory()async{
    Uri url=Uri.https("api.themoviedb.org","/3/genre/movie/list",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7"
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    BrowseResponse browseResponse=BrowseResponse.fromJson(jsonFormat);
    return browseResponse;
  }

  //https://api.themoviedb.org/3/discover/movie?apiKey=22d1f1116a2c8e99422e87fcedacb1e7
  static Future<MovieDiscoverResponse> getMovieDiscover(int genreId)async{
    Uri url=Uri.https("api.themoviedb.org","/3/discover/movie",{
      "api_key":"22d1f1116a2c8e99422e87fcedacb1e7",
      "with_genres":genreId.toString()
    });
    http.Response response=await http.get(url);
    Map<String,dynamic> jsonFormat=jsonDecode(response.body);
    MovieDiscoverResponse movieDiscoverResponse=MovieDiscoverResponse.fromJson(jsonFormat);
    return movieDiscoverResponse;
  }
}