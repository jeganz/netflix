import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix/backend/contentpage/models/castmodel.dart';
import 'package:netflix/backend/contentpage/models/moviemodel.dart';
import "package:http/http.dart" as http;

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc() : super(ContentInitial()) {
    on<MoviefetchEvent>((event, emit) async {
      try {
        var client = http.Client();
        final ca = await client.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${event.id}/credits?api_key=83be544d5a4f384431c27facc0255969#'));
        final movresp = await client.get(Uri.parse(
            'https://api.themoviedb.org/3/movie/${event.id}?api_key=83be544d5a4f384431c27facc0255969#'));
        final mov = jsonDecode(movresp.body);
        final cas = jsonDecode(ca.body);

        MovieDetail movie = MovieDetail.fromJson(mov);

        Cast cast = Cast.fromJson(cas);

        emit(ContentState(movie, cast.cast));

        print(mov);
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
