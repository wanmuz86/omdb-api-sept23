import 'package:flutter/material.dart';
import 'package:movies_app_sept23/models/movie_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _movies = [
    // {
    //   "Title": "The Lord of the Rings: The Fellowship of the Ring",
    //   "Year": "2001",
    //   "imdbID": "tt0120737",
    //   "Type": "movie",
    //   "Poster":
    //       "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg"
    // },
    // {
    //   "Title": "The Lord of the Rings: The Return of the King",
    //   "Year": "2003",
    //   "imdbID": "tt0167260",
    //   "Type": "movie",
    //   "Poster":
    //       "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
    // },
    // {
    //   "Title": "The Lord of the Rings: The Two Towers",
    //   "Year": "2002",
    //   "imdbID": "tt0167261",
    //   "Type": "movie",
    //   "Poster":
    //       "https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"
    // },
    // {
    //   "Title": "The Lord of the Rings: The Rings of Power",
    //   "Year": "2022–",
    //   "imdbID": "tt7631058",
    //   "Type": "series",
    //   "Poster":
    //       "https://m.media-amazon.com/images/M/MV5BNTg3NjcxYzgtYjljNC00Y2I2LWE3YmMtOTliZTkwYTE1MmZiXkEyXkFqcGdeQXVyNTY4NDc5MDE@._V1_SX300.jpg"
    // },
    // {
    //   "Title": "Lord of War",
    //   "Year": "2005",
    //   "imdbID": "tt0399295",
    //   "Type": "movie",
    //   "Poster":
    //       "https://m.media-amazon.com/images/M/MV5BMTYzZWE3MDAtZjZkMi00MzhlLTlhZDUtNmI2Zjg3OWVlZWI0XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg"
    // }
  ];
  var searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: TextField(
                        controller: searchEditingController,
                        decoration:
                      InputDecoration(hintText: "Enter movie "),)),
                  Expanded(
                      flex:1,
                      child: TextButton(onPressed: (){
                        // When you have a method return Future<DataType>
                        // Call it using async await
                        // Or you can use (then)

                       fetchMovies(searchEditingController.text).then((value) => {
                         setState((){
                           _movies = value;
                         })
                       });


                      }, child: Text("Search")))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _movies.length, // how many rows / length of the dataset
                  itemBuilder: (context,index){ /// what to show for each index
                    return ListTile(
                      title: Text(_movies[index].title),
                      subtitle: Text(_movies[index].year),
                      trailing: Icon(Icons.chevron_right),
                      leading: _movies[index].poster != "N/A" ?
                      Image.network(_movies[index].poster) : SizedBox(),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=>DetailPage(imdbId: _movies[index].imdbId,))
                        );
                      },
                    );
                  }),
            )
          ],
        )
    );
  }
  // This is a method that's going to work asynchronous - Future
  // <DataType> => Datatype returned by the API and the transformation
  // If it is an array, It's going to be List<ClassName>
  // If it is an object, It's going to be <ClassName>
  // Import movie_search on top
  Future<List<MovieSearch>> fetchMovies(searchText) async {
    // import http modules.
    // change the URL
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?s=$searchText&apikey=87d10179'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // If it is an array, call the fifth method from the class : moviesFromJson
      // If it is an object, call the forth method : fromJson
      // jsonDecode needs dart:convert import to work
      return MovieSearch.moviesFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }
}
