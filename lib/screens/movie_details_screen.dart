import 'package:flutter/material.dart'; // import material package
import 'package:shape_movies/themes/theme.dart'; // import theme file

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final String year;
  final String poster;
  final String plot;

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.year,
    required this.poster,
    required this.plot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTheme.appBarTextStyleSmall,
        ), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView( // use ListView instead of Column because on smaller screens its overflowing 
          children: [
            Center(
              child: poster != 'N/A'
                  ? Image.network(poster) // poster
                  : const Icon(Icons.movie, size: 150), // default movie icon
            ),
            const SizedBox(height: 20),
            Text(
              'Title: $title',
              style: AppTheme.titleTextStyle,
            ),
            Text(
              'Year: $year',
              style: AppTheme.yearTextStyle,
            ),
            const SizedBox(height: 10),
            Text(
              'Plot: $plot',
              style: AppTheme.plotTextStyle,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}