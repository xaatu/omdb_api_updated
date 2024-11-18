import 'package:flutter/material.dart'; // import material package
import 'screens/home.dart'; // imports home screen
import 'package:shape_movies/themes/theme.dart'; // import theme file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHAPE Movies', // name of the app 
      theme: AppTheme.lightTheme, // use light theme from theme.dart
      home: const HomeScreen(), 
    );
  }
}
