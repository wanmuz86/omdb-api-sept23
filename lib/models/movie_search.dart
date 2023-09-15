// 1 ) Create class

class MovieSearch {
  // 2) List down the properties of the class
  // Flutter convention (camelCase)
  final String imdbId;
  final String year;
  final String title;
  final String type;
  final String poster;

  // 3 ) Create the constructor of the class

MovieSearch({required this.imdbId,
  required this.year,
  required this.title,
  required this.type,
  required this.poster});

// 4) Create a JSON to Object Transformer method

factory MovieSearch.fromJson(Map<String, dynamic> json) {
  return MovieSearch(imdbId: json["imdbID"],
      year: json["Year"],
      title: json["Title"],
      type: json["Type"],
      poster: json["Poster"]);
}

// Conditional Step 5 : If your UI has a ListView -> If you are manipulation an Array of Object
// Step5 - Create an Array of Json to List of Map transformer

  static List<MovieSearch> moviesFromJson(dynamic json ){
    var searchResult = json["Search"];
    List<MovieSearch> results = List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(MovieSearch.fromJson(v))
      });
      return results;
    }
    return results;
  }

}