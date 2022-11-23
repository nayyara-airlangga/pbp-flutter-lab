import 'package:counter_7/datasource/mywatchlist.dart';
import 'package:counter_7/models/mywatchlist.dart';
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
              itemBuilder: (ctx, i) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: watchlists[i].fields.watched
                        ? Colors.green
                        : Colors.grey,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Text(watchlists[i].fields.title),
                  trailing: Checkbox(
                    value: watchlists[i].fields.watched,
                    activeColor: Colors.green,
                    onChanged: (bool? val) {
                      if (val != null) {
                        setState(() {
                          watchlists[i].fields.watched = val;
                        });
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
