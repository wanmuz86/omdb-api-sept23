
// Step 1 : Create the class
class MovieDetail {
  // Step 2 : Create the properties
  final String title;
  final String year;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String actors;
  final String plot;
  final String poster;

  // Step 3: Create the constructor

MovieDetail({required this.title, required this.year, required this.released,
required this.runtime, required this.genre, required this.director,
required this.actors, required this.poster, required this.plot});
 // Step 4 : Create toJson method

factory MovieDetail.fromJson(Map<String, dynamic> json){
  print(json);
  return MovieDetail(title: json["Title"],
      year: json["Year"],
      released: json["Released"],
      runtime: json["Runtime"],
      genre: json["Genre"],
      director: json["Director"],
      actors: json["Actors"],
      poster: json["Poster"],
      plot: json["Plot"]);
}
}