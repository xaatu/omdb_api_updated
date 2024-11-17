import 'package:flutter/material.dart'; // import material package
import 'services/omdb_service.dart'; // import omdb service for API data
import 'movie_details_screen.dart'; // Import MovieDetailsScreen 

class MovieSearchScreen extends StatefulWidget { // stateful = dynamic
  const MovieSearchScreen({super.key}); 

  @override
  // to manage state for this screen
  MovieSearchScreenState createState() => MovieSearchScreenState();
}
// manage dynamic data
class MovieSearchScreenState extends State<MovieSearchScreen> {
  // manage text field
  final TextEditingController _searchController = TextEditingController();
  // need more info on future
  Future<List<Movie>>? _searchResults;

  void _searchMovies() { //_ for private method (only used in this file)
    setState(() {
      // calls searchMovies - passes text from _searchController - stores result in _searchResults
      _searchResults = OmdbService().searchMovies(_searchController.text);
    });
  }

  @override
  // UI
  Widget build(BuildContext context) {
    return Scaffold( // structuring the page
      appBar: AppBar( // app bar with title
        title: const Text(
          'Search Movies', // title of page
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30, 
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0), // app bar padding
        child: Column( // vertical column
          children: [
            TextField(
              controller: _searchController, // manage input
              decoration: const InputDecoration( 
                labelText: 'Enter movie title', // placeholder text
                border: OutlineInputBorder( // outline border for input text
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton( // raised button
              onPressed: _searchMovies, // calls _searchMovies on button press
              style: ElevatedButton.styleFrom( // button styling
                backgroundColor: Colors.black, // button bg colour
                foregroundColor: Colors.white, // button text colour
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15), // padding
                textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // text style
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // round corners
                ),
              ),
              child: const Text('Search'), // button text
            ),
            const SizedBox(height: 30),
            Expanded( // fills available space with search results
              child: _searchResults == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // vertically center the content
                        children: [
                          Text(
                            'In space, no one can hear you scream - Alien (1979)', // movie quote (tagline I guess in this case...)
                            textAlign: TextAlign.center, //  center text
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10), // space between quote and instruction
                          Text(
                            'Try searching for a movie!', // instruction
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  : FutureBuilder<List<Movie>>(
                      future: _searchResults,
                      builder: (context, snapshot) {
                        //error handling
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('404 - Movie not found.')); // needs a better reference
                        } else {
                          final movies = snapshot.data!;
                          return ListView.builder(
                            itemCount: movies.length,
                            itemBuilder: (context, index) {
                              final movie = movies[index];
                              return GestureDetector( // detects user clicks or taps
                                onTap: () {
                                  // nav to MovieDetailsScreen when tapped
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailsScreen(
                                        title: movie.title,
                                        year: movie.year,
                                        poster: movie.poster,
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: movie.poster != 'N/A'
                                      ? Image.network(movie.poster)
                                      : const Icon(Icons.movie),
                                  title: Text(movie.title),
                                  subtitle: Text('Year: ${movie.year}'),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
