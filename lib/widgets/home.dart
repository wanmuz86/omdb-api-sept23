import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _movies = [
    {
      "Title": "The Lord of the Rings: The Fellowship of the Ring",
      "Year": "2001",
      "imdbID": "tt0120737",
      "Type": "movie",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_SX300.jpg"
    },
    {
      "Title": "The Lord of the Rings: The Return of the King",
      "Year": "2003",
      "imdbID": "tt0167260",
      "Type": "movie",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg"
    },
    {
      "Title": "The Lord of the Rings: The Two Towers",
      "Year": "2002",
      "imdbID": "tt0167261",
      "Type": "movie",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BZGMxZTdjZmYtMmE2Ni00ZTdkLWI5NTgtNjlmMjBiNzU2MmI5XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg"
    },
    {
      "Title": "The Lord of the Rings: The Rings of Power",
      "Year": "2022–",
      "imdbID": "tt7631058",
      "Type": "series",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BNTg3NjcxYzgtYjljNC00Y2I2LWE3YmMtOTliZTkwYTE1MmZiXkEyXkFqcGdeQXVyNTY4NDc5MDE@._V1_SX300.jpg"
    },
    {
      "Title": "Lord of War",
      "Year": "2005",
      "imdbID": "tt0399295",
      "Type": "movie",
      "Poster":
          "https://m.media-amazon.com/images/M/MV5BMTYzZWE3MDAtZjZkMi00MzhlLTlhZDUtNmI2Zjg3OWVlZWI0XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_SX300.jpg"
    }
  ];
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
                      child: TextField(decoration: InputDecoration(hintText: "Enter movie "),)),
                  Expanded(
                      flex:1,
                      child: TextButton(onPressed: (){}, child: Text("Search")))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _movies.length, // how many rows / length of the dataset
                  itemBuilder: (context,index){ /// what to show for each index
                    return ListTile(
                      title: Text(_movies[index]["Title"]!),
                      subtitle: Text(_movies[index]["Year"]!),
                      trailing: Icon(Icons.chevron_right),
                      leading: Image.network(_movies[index]["Poster"]!),
                    );
                  }),
            )
          ],
        )
    );
  }
}
