import 'package:flutter/material.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/movie_details.dart';

import 'screens/home_screen.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.theme,
      darkTheme: MyThemeData.theme,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName:(context)=>HomeScreen(),
        MovieDetails.routName:(context)=>MovieDetails(),
      },
    );
  }
}
