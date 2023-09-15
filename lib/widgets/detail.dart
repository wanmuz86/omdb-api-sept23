import 'package:flutter/material.dart';
import 'package:movies_app_sept23/models/movie_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final String imdbId;
  const DetailPage({super.key, required this.imdbId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  MovieDetail? movie;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchMovie().then((value) => {

      // in Flutte movie = value <- Assigning without refresging

      // SetState means <-Assign and Refresh the page
      setState((){
        movie = value;
      })

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body: movie == null ? Center(child: CircularProgressIndicator()):
      // Since we have an optional data type, we can't call the movie directly
      // We have to use ! or to put it within and if else
      // We put it inside an exclamation mark because we are sure that it is non null
      ShowMovieWidget(movie: movie),
    );
  }

  Future<MovieDetail> fetchMovie() async {
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?i=${widget.imdbId}&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return MovieDetail.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie');
    }
  }
}

class ShowMovieWidget extends StatelessWidget {
  const ShowMovieWidget({
    super.key,
    required this.movie,
  });

  final MovieDetail? movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: Center(child: Column(
        children: [
          Text(movie!.title),
          Image.network(movie!.poster),
          Text(movie!.genre),
          Text(movie!.year),
          Text(movie!.released),
          Text(movie!.runtime),
          Text(movie!.actors),
          Text(movie!.director),
          Text(movie!.plot),
        ],
      )),
    );
  }
}
