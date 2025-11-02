
import 'package:flutter/material.dart';
import 'package:movie_app/modules/moview.dart';
import 'package:movie_app/providers/moview_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie, this.isDetails =false,
  });

  final Movie movie;
  final bool isDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text("Director: ${movie.director}"),
        leading: CircleAvatar(backgroundImage: NetworkImage(movie.images[0])),
        children: [
          Container(
            // border: Border.all(color: Colors.grey),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 70.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "Released: ",
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${movie.released} \n'),
                      TextSpan(
                        text: "Plot :",
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '${movie.plot} \n'),
                    ],
                  ),
                ),
                isDetails ? Text("") :  TextButton(onPressed: () => {
    
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>  MoviewDetails(movieTile: movie,)))
    
    
    
                }, child: const Text("Read More"))
    
              ],
            ),
          ),
        ],
      ),
    );
  }
}
