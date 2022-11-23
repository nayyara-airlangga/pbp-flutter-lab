import 'package:flutter/material.dart';

class WatchlistDetailText extends StatelessWidget {
  final String title;
  final String value;

  const WatchlistDetailText({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$title: ",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
