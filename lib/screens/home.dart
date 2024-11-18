import 'package:flutter/material.dart'; // import material package
import 'movie_search_screen.dart'; // import search screen
import 'package:shape_movies/themes/theme.dart'; // import theme file

class HomeScreen extends StatefulWidget { // dynamic
  const HomeScreen({super.key}); // need const or there is a problem - key for identification

  @override // need more info on override, i know it overrides parent class
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold
      appBar: AppBar(
        title: const Text(
          'SHAPE Movies ▶', // page title
          style: AppTheme.appBarTextStyle, // use text style from theme
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // add padding around the body
        child: Column( // use a column to stack image and button
          mainAxisAlignment: MainAxisAlignment.center, // center content vertically
          children: [
            // image
            Image.asset(
              'assets/shapes.png', // image path
              height: 400, 
              width: 400,
              fit: BoxFit.cover, // image fit style
            ),
            const SizedBox(height: 60), // space between image and button
            ElevatedButton( // raised button
              onPressed: () {
                // button directs to MovieSearchScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MovieSearchScreen()),
                );
              },
              style: AppTheme.buttonStyle, // use button style from theme
              child: const Text('Go to Movie Search'), // button text
            ),
          ],
        ),
      ),
    );
  }
}
