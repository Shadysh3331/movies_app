import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/firebase_options.dart';
import 'package:movie_app/my_theme_data.dart';
import 'package:movie_app/screens/movie_details.dart';
import 'package:movie_app/screens/movie_discover.dart';

import 'screens/home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
        MovieDiscover.routName:(context)=>MovieDiscover(),
      },
    );
  }
}
