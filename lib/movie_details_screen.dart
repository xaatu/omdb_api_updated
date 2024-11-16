import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String title;
  final String year;
  final String poster;

  const MovieDetailsScreen({
    super.key,
    required this.title,
    required this.year,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // film title on app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: poster != 'N/A'
                  ? Image.network(poster) // poster
                  : const Icon(Icons.movie, size: 150), // default movie icon for if there isn't a poster - https://api.flutter.dev/flutter/material/Icons-class.html
            ),
            const SizedBox(height: 20),
            Text(
              'Title: $title',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'Year: $year',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
