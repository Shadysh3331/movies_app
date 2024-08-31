import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/models/PopularResponse.dart';
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
}