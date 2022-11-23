import 'package:counter_7/datasource/mywatchlist.dart';
import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/widgets/mywatchlist/watchlist_tile.dart';
import 'package:counter_7/widgets/shared/app_drawer.dart';
import 'package:flutter/material.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<MyWatchlist>> _myWatchlistFut = getMyWatchlists();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text("My Watch List")),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            _myWatchlistFut = getMyWatchlists();
          });
          return _myWatchlistFut;
        },
        child: FutureBuilder(
          initialData: const <MyWatchlist>[],
          future: _myWatchlistFut,
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final watchlists = snapshot.data ?? [];

            return ListView.builder(
              itemCount: watchlists.length,
              itemBuilder: (ctx, i) => WatchlistTile(
                fields: watchlists[i].fields,
              ),
            );
          },
        ),
      ),
    );
  }
}
