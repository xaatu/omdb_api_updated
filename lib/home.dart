import 'package:flutter/material.dart'; // import material package
import 'movie_search_screen.dart'; // import search screen

class HomeScreen extends StatefulWidget { // dynamic
  const HomeScreen({super.key}); // need const or there is a problem - key for identification

  @override // need more info on override, i know it overrides parent class
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int uval = 1; // 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( // scaffold
      appBar: AppBar(
        title: const Text(
          'Home Screen', // page title
          style: TextStyle(
            fontWeight: FontWeight.bold, // bold font
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton( // raised button
          onPressed: () {
            // button directs to MovieSearchScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MovieSearchScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0), // button bg colour
            foregroundColor: Colors.white, // button text colour
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20), // button inside padding
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // text style
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40), // round corners
            ),
          ),
          child: const Text('Go to Movie Search Screen'), // button text
        ),
      ),
    );
  }
}
