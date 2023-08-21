import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix/backend/home/models/trendingmov.dart';
import 'package:netflix/backend/home/models/trendmodel.dart';
import 'package:http/http.dart' as http;

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomefetchSuccess()) {
    on<HomeinitialFetch>((event, emit) async {
      try {
        var client = http.Client();
        var allresp = await client.get(Uri.parse(
            'https://api.themoviedb.org/3/trending/all/day?api_key=83be544d5a4f384431c27facc0255969#'));
        var movresp = await client.get(Uri.parse(
            'https://api.themoviedb.org/3/trending/movie/day?api_key=83be544d5a4f384431c27facc0255969#'));
        var tvresp = await client.get(Uri.parse(
            'https://api.themoviedb.org/3/trending/tv/day?api_key=83be544d5a4f384431c27facc0255969#'));
        final result = jsonDecode(allresp.body);
        Trending t1 = Trending.fromJson(result);
        final movresult = jsonDecode(movresp.body);
        TrendingMov movt = TrendingMov.fromJson(movresult);
        final tvresult = jsonDecode(tvresp.body);
        TrendingMov tvt = TrendingMov.fromJson(tvresult);
        emit(HomeState(
            result: t1.results,
            movresult: movt.results,
            tvresult: tvt.results));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
