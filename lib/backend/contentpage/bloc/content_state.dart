part of 'content_bloc.dart';

class ContentState {
  final MovieDetail movie;
  final List<CastElement> cast;

  const ContentState(this.movie, this.cast);
}

final class ContentInitial extends ContentState {
  ContentInitial()
      : super(
          MovieDetail(
              backdropPath: '',
              genres: [],
              id: 0,
              originalLanguage: '',
              originalTitle: '',
              overview: '',
              posterPath: '',
              releaseDate: DateTime(000),
              runtime: 0,
              voteAverage: 0),
          [],
        );
}
