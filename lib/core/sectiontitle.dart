import 'package:flutter/material.dart';

class Sectiontitle extends StatelessWidget {
  const Sectiontitle({super.key, required this.emoji, required this.title});
  final String title;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        children: [
          Text(
            "$emoji  ",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Text(
            'See all',
            style: TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
