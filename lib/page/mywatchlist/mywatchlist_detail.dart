import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/widgets/mywatchlist/watchlist_detail_text.dart';
import 'package:counter_7/widgets/shared/app_drawer.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class MyWatchlistDetailPage extends StatelessWidget {
  final MyWatchlistFields movie;

  const MyWatchlistDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final releaseDate = DateFormat("MMM dd, yyyy").format(movie.releaseDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
            WatchlistDetailText(title: "Release Date", value: releaseDate),
            const SizedBox(height: 8),
            WatchlistDetailText(title: "Rating", value: "${movie.rating} / 5"),
            const SizedBox(height: 8),
            WatchlistDetailText(
              title: "Status",
              value: movie.watched ? "Watched" : "Not Watched",
            ),
            const SizedBox(height: 8),
            WatchlistDetailText(
              title: "Review",
              value: "\n${movie.review}",
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Back"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
