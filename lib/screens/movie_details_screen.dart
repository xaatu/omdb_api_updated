import 'package:flutter/material.dart';
import 'package:shape_movies/themes/theme.dart'; // Import the theme file

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final String year;
  final String poster;
  // add plot

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.year,
    required this.poster,
    // add plot
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTheme.appBarTextStyleSmall, // Use theme style for AppBar title
        ), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: poster != 'N/A'
                  ? Image.network(poster) // poster
                  : const Icon(Icons.movie, size: 150), // default movie icon
            ),
            const SizedBox(height: 20),
            Text(
              'Title: $title',
              style: AppTheme.movieTitleTextStyle, // Use theme style for movie title
            ),
            Text(
              'Year: $year',
              style: AppTheme.movieYearTextStyle, // Use theme style for movie year
            ),
            const SizedBox(height: 10),
            // add plot
          ],
        ),
      ),
    );
  }
}
