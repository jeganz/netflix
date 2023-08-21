import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/backend/home/bloc/home_bloc.dart';
import 'package:netflix/constants/colors.dart';
import 'package:netflix/core/appbar.dart';
import 'package:netflix/core/moviecontainerrow.dart';
import 'package:netflix/core/sectiontitle.dart';
import 'package:netflix/home/widget/catergbar.dart';

import '../widget/carouselcontainer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeBloc>().add(HomeinitialFetch());
    });
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        darkred,
        Colors.black,
      ], radius: .8, center: Alignment(0, -.3))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          const Customappbar(
            lefticon: Icons.window,
            righticon: Icons.notifications_none_sharp,
          ),
          const Sectiontitle(emoji: "🌟", title: 'Top View'),
          const SizedBox(height: 15),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.result.length != 0) {
                return CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    String image =
                        'https://image.tmdb.org/t/p/w500${state.result[index].backdropPath}';
                    return Carcontainer(
                      image: image,
                    );
                  },
                  options: CarouselOptions(
                    height: 180,
                    viewportFraction: 0.85,
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          const SizedBox(height: 15),
          const Sectiontitle(emoji: "🎟️", title: "Top Categories"),
          const CategBar(),
          const SizedBox(height: 10),
          const Sectiontitle(emoji: "🪄", title: "New Movies"),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.movresult.isNotEmpty) {
                return MovielistRow(
                  result: state.movresult,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          const SizedBox(height: 10),
          const Sectiontitle(emoji: "🪄", title: "New Series"),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.tvresult.isNotEmpty) {
                return MovielistRow(
                  result: state.tvresult,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ]),
      ),
    );
  }
}
