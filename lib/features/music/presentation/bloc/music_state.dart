part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();

  @override
  List<Object> get props => [];
}

class MusicInitial extends MusicState {}

class MusicLoadInProgress extends MusicState {}

class MusicLoadSuccess extends MusicState {
  final List<String> musics;

  const MusicLoadSuccess([this.musics = const []]);

  @override
  List<Object> get props => [musics];
}

class MusicLoadFailure extends MusicState {}
