import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/backend/contentpage/bloc/content_bloc.dart';
import 'package:netflix/constants/helper.dart';
import 'package:netflix/content%20page/contentpage.dart';

class MovielistRow extends StatelessWidget {
  const MovielistRow({super.key, required this.result});
  final result;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          final String image =
              'https://image.tmdb.org/t/p/w500${result[index].posterPath}';
          final name = result[index].title;
          final genre = genreget(result[index].genreIds[0]);
          final int rate = result[index].voteAverage.round();
          return MovieContainer(
            id: result[index].id,
            image: image,
            name: name,
            genre: genre,
            rating: rate,
          );
        },
      ),
    );
  }
}

class MovieContainer extends StatelessWidget {
  const MovieContainer(
      {super.key,
      required this.image,
      required this.name,
      required this.id,
      required this.genre,
      required this.rating});
  final int id;
  final String image;
  final String name;
  final String genre;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: GestureDetector(
        onTap: () {
          context.read<ContentBloc>().add(MoviefetchEvent(id: id));

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContentPage(),
          ));
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 40, 3, 1),
              borderRadius: BorderRadius.circular(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 130,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          image,
                        )),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(18))),
              ),
              const SizedBox(height: 12),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(name,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      genre,
                      style: TextStyle(color: Colors.grey.withOpacity(.9)),
                    ),
                    const Spacer(),
                    Text(
                      '$rating/10 ⭐',
                      style: TextStyle(color: Colors.grey.withOpacity(.9)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
