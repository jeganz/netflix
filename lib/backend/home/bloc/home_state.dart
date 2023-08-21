part of 'home_bloc.dart';

class HomeState {
  final List<Result> result;
  final List<MovResult> movresult;
  final List<MovResult> tvresult;

  HomeState(
      {required this.result, required this.movresult, required this.tvresult});
}

class HomefetchSuccess extends HomeState {
  HomefetchSuccess() : super(result: [], movresult: [], tvresult: []);
}
