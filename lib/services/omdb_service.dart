import 'package:dio/dio.dart';

class OmdbService {
  final Dio _dio = Dio();  
  /* loaded black screen - I thought the issue was with HTML so i switched to dio
  based on some advice on stack overflow, only to find the app runs in an iphone & Ipad simulator, 
  but not macOS - find out why */

  /* I cannot get the .env file to work, i have watched a few videos and 
  checked stack overflow. I understand why it is necessary to use a .env
  to store sensitive data (in this case the API key) but i've had to
  hardcode it because otherwise my project won't run - sorry not best practice i know */
  final String apiKey = "c3fea1ad";

  /* API call using Dio - again this was an attempt to get 
  around what i thought was an issue with HTTP.
  Tried turning off VPN etc first this was a last resort */
  Future<List<Movie>> searchMovies(String query) async {
    try { // try catch error handling
      final response = await _dio.get( // get request to OMDB API using dio 
        'https://www.omdbapi.com/',
        queryParameters: {
          's': query, // movie title search query
          'apikey': apiKey, 
        },
      );

      if (response.statusCode == 200 && response.data['Search'] != null) {
        List<Movie> movies = (response.data['Search'] as List).map((item) => Movie.fromJson(item)).toList(); // response in JSON format to be parsed and displayed

        // use imdbID to fetch plot details
        for (var movie in movies) {
          movie.plot = (await fetchPlotByImdbId(movie.imdbId))!; // update movie plot
        }

        return movies;
      }
    } catch (e) {
      // print("Error: e"); - this was from the issues i faced with
      // the MacOS and was no longer necessary when using xcode simulator
    }
    return []; // return empty list if there are no results 
  }
  Future<String?> fetchPlotByImdbId(String imdbId) async {
    try { // try catch error handling
      final response = await _dio.get( // get request to OMDB API using dio 
        'https://www.omdbapi.com/',
        queryParameters: {
          'i': imdbId, // imdb id needed for plot
          'apikey': apiKey,
        },
      );

      if (response.statusCode == 200 && response.data['Plot'] != null) {
        return response.data['Plot']; // plot
      }
    } catch (e) {
      // print("Error: e"); - this was from the issues i faced with
      // the MacOS and was no longer necessary when using xcode simulator
    }
    return null;
  }
}


// formatting the retrieved data
class Movie {
  final String title;
  final String year;
  final String poster;
  String plot;
  final String imdbId;

  // required = must provide parameters
  // this = assigns parameter values directly to linked class properties
  Movie({required this.title, required this.year, required this.poster, required this.plot, required this.imdbId});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      plot: json['Plot'] ?? 'Plot not available', // if not available shows 'plot not available'
      imdbId: json['imdbID'],
    );
  }
}