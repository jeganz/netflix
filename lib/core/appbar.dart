import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  const Customappbar(
      {super.key, required this.lefticon, required this.righticon});
  final IconData lefticon;
  final IconData righticon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Appbaricon(icon: lefticon)),
          Image.asset(
            'assets/netflixlogo.png',
            scale: .75,
          ),
          Appbaricon(icon: righticon)
        ],
      ),
    );
  }
}

class Appbaricon extends StatelessWidget {
  const Appbaricon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(.3),
            borderRadius: BorderRadius.circular(15)),
        child: Icon(
          icon,
          color: Colors.grey.withOpacity(.6),
        ),
      ),
    );
  }
}
