import 'package:flutter/material.dart';
import 'package:movie_app/firebase_functions.dart';
import 'package:movie_app/widgets/watchlist_items.dart';

class Whatchlist extends StatelessWidget {
  const Whatchlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          Text(
            "Watchlist",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 22,
                ),
          ),
          StreamBuilder(
            stream: FirebaseFunctions.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("something went wrong"));
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text("Your watchlist is empty"));
              }
              var movies = snapshot.data!.docs.map((doc) => doc.data()).toList();
              return Expanded(
                child:ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(thickness: 2,color: Color(0xff707070));
                  },
                  itemBuilder: (context, index) {
                    return WatchlistItems(movies: movies[index],);
                },itemCount: movies.length,)
              );
            },
          )
        ],
      ),
    );
  }
}
