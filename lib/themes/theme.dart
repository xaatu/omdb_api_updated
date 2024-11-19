import 'package:flutter/material.dart'; // import material package

class AppTheme {
  // appBar text (large)
  static const TextStyle appBarTextStyle = TextStyle(
    fontWeight: FontWeight.bold, // bold font
    fontSize: 40,
  );

  // appBar text (smaller)
  static const TextStyle appBarTextStyleSmall = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );

  // quotes & instructions text style
  static const TextStyle quoteTextStyle = TextStyle(
    fontSize: 18, 
    fontWeight: FontWeight.bold,
  );

  static const TextStyle instructionTextStyle = TextStyle(
    fontSize: 16, 
    fontWeight: FontWeight.normal,
  );

  // button style (elevated button)
  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0), // button bg colour
    foregroundColor: Colors.white, // button text colour
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20), // button inside padding
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // text style
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // round corners
    ),
  );

  // search button
  static final ButtonStyle searchButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black, // button bg colour
    foregroundColor: Colors.white, // button text colour
    padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15), // button inside padding
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // text style
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // round corners
    ),
  );

  // movie details TITLE
  static const TextStyle movieTitleTextStyle = TextStyle(
    fontSize: 22, 
    fontWeight: FontWeight.bold,
  );

  // movie details YEAR
  static const TextStyle movieYearTextStyle = TextStyle(
    fontSize: 18,
  );
  // light theme
static final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),

  appBarTheme: const AppBarTheme(
    color: Color.fromARGB(255, 255, 255, 255),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(color: Color.fromARGB(255, 51, 51, 51)),

    // default border
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 5.0,
      ),
    ),

    // when the field is focussed
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 0, 0, 0),
        width: 5.0,
      ),
    ),

    // enabled border (when page first loads, not focussed)
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 124, 124, 124), 
        width: 5.0,
      ),
    ),

    

  ),
);




}