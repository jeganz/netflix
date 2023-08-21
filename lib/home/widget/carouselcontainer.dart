import 'package:flutter/material.dart';

class Carcontainer extends StatelessWidget {
  const Carcontainer({super.key, required this.image});
  final image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .8,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
