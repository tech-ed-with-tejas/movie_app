import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/app_bar.dart';
import 'package:movie_app/Widgets/movie_card.dart';
import 'package:movie_app/modules/moview.dart';
import 'package:movie_app/providers/movie_provider.dart' show MovieProvider;
import 'package:movie_app/providers/moview_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MovieProvider>(context, listen: false).loadMoviews(context);
    print("movieProvider");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    return Scaffold(
      appBar: Header(title: 'Movie APP',),
      body: Center(
        child: ListView.builder(
          itemCount: movieProvider.movieList.length,
          itemBuilder: (context, index) {
            final movie = movieProvider.movieList[index];

            return MovieCard(movie: movie);
          },
        ),
      ),
    );
  }
}

