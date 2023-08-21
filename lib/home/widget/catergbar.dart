import 'package:flutter/material.dart';

class CategBar extends StatelessWidget {
  const CategBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Categorylist = [
      '😎-Action',
      '😂-Comdey',
      '😍-Romance',
      '🥲-Sad',
      '😱-Horoor',
      '⚽-Sports'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 80,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Categorylist.length,
          itemBuilder: (context, index) =>
              Categitem(categ: Categorylist[index]),
        ),
      ),
    );
  }
}

class Categitem extends StatelessWidget {
  const Categitem({super.key, required this.categ});
  final categ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 80,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.3),
          borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Text(
              categ.split('-')[0],
              style: TextStyle(fontSize: 25),
            ),
            Text(
              categ.split('-')[1],
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
