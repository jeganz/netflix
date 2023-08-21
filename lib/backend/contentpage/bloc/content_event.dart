part of 'content_bloc.dart';

@immutable
sealed class ContentEvent {}

class MoviefetchEvent extends ContentEvent {
  final int id;

  MoviefetchEvent({required this.id});
}
