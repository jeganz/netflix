import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/backend/contentpage/models/castmodel.dart';
import 'package:netflix/core/appbar.dart';
import 'package:netflix/core/sectiontitle.dart';

import '../backend/contentpage/bloc/content_bloc.dart';
import '../constants/colors.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContentBloc, ContentState>(
      builder: (context, state) {
        if (state.movie.id != 0) {
          final movie = state.movie;
          return Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(colors: [
                darkred,
                Colors.black,
              ], radius: .8, center: const Alignment(0, -.3))),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                        opacity: .2,
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath}'))),
                child: Scaffold(
                    appBar: const PreferredSize(
                      preferredSize: Size(double.infinity, 70),
                      child: Customappbar(
                        lefticon: Icons.arrow_back,
                        righticon: Icons.ios_share_sharp,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    body: ListView(children: [
                      const SizedBox(
                        height: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 250,
                              width: 180,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://www.themoviedb.org/t/p/w300_and_h450_bestv2${movie.posterPath}')),
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.originalTitle,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${"Type".padRight(16)}: Action',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${"Language".padRight(10)}: ${movie.originalLanguage}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${"Published".padRight(12)}: ${movie.releaseDate.year}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${"Rating".padRight(15)}: ${movie.voteAverage.round()}/10⭐',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    '${"Duration".padRight(13)}: ${movie.runtime}m',
                                    style: const TextStyle(fontSize: 14),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Sectiontitle(emoji: '🧿', title: 'Overview'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0),
                        child: Text(
                          movie.overview,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const Sectiontitle(emoji: '🎲', title: 'Cast'),
                      Container(
                        height: 160,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Castbox(cast: state.cast[index]);
                          },
                        ),
                      )
                    ])),
              ));
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}

class Castbox extends StatelessWidget {
  const Castbox({super.key, required this.cast});
  final CastElement cast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.themoviedb.org/t/p/w138_and_h175_face${cast.profilePath}')),
                borderRadius: BorderRadius.circular(18)),
          ),
          Text(
            cast.name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            cast.character!.split('/')[0],
            style: const TextStyle(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
