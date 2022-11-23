import 'package:counter_7/models/mywatchlist.dart';
import 'package:flutter/material.dart';

class WatchlistTile extends StatefulWidget {
  final MyWatchlistFields fields;

  const WatchlistTile({super.key, required this.fields});

  @override
  State<WatchlistTile> createState() => _WatchlistTileState();
}

class _WatchlistTileState extends State<WatchlistTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.fields.watched ? Colors.green : Colors.grey,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: Text(widget.fields.title),
        trailing: Checkbox(
          value: widget.fields.watched,
          activeColor: Colors.green,
          onChanged: (bool? val) {
            if (val != null) {
              setState(() {
                widget.fields.watched = val;
              });
            }
          },
        ),
      ),
    );
  }
}
