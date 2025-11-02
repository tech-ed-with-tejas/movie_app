import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/app_bar.dart';
import 'package:movie_app/Widgets/movie_card.dart';
import 'package:movie_app/modules/moview.dart';

class MoviewDetails extends StatelessWidget {
  const MoviewDetails({super.key, required this.movieTile});

  final Movie movieTile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(title: 'Movie Details',),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          MovieCard(movie: movieTile,isDetails: true,),
          Text("Movie Poster",
          style:Theme.of(context).textTheme.headlineSmall),

          SizedBox(height: 200,width: double.infinity,child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieTile.images.length,
            itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              child: Image.network(movieTile.images[index],  fit:BoxFit.cover),
                        

              );
          },)),
          
          
          
          ]),
      ),
    );
  }
}
