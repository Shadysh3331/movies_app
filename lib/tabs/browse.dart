import 'package:flutter/material.dart';
import 'package:movie_app/apis/api_manager.dart';
import 'package:movie_app/widgets/browse_item.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.1,),
          Text("Browse Category",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 22,
          ),),
          FutureBuilder(
            future: ApiManager.getCategory(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("something went wrong"));
              }
              var browse = snapshot.data?.genres ?? [];
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    mainAxisSpacing: 30,crossAxisSpacing: 30
                  ),
                  itemBuilder: (context, index) {
                  return BrowseItem(genres: browse[index]);
                },
                itemCount: browse.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
