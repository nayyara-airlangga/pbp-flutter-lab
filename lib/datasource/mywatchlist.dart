import 'dart:convert';

import 'package:counter_7/models/mywatchlist.dart';
import 'package:http/http.dart' as http;

Future<List<MyWatchlist>> getMyWatchlists() async {
  final uri =
      Uri.parse("http://pbp-web-assignment.herokuapp.com/mywatchlist/json");
  final res = await http.get(uri, headers: {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
  });
  final data = jsonDecode(res.body);

  List<MyWatchlist> myWatchlists = [];
  for (dynamic item in data) {
    if (item != null) {
      myWatchlists.add(MyWatchlist.fromMap(item));
    }
  }

  return myWatchlists;
}
