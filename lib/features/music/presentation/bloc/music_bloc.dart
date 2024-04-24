import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  MusicBloc() : super(MusicInitial()) {
    on<LoadMusic>(_onLoadMusic);
  }

  Future<void> _onLoadMusic(LoadMusic event, Emitter<MusicState> emit) async {
    emit(MusicLoadInProgress());
    try {
      // Aqui buscaria as músicas. Estou apenas simulando com uma lista estática.
      final musics = await _fetchMusic();
      emit(MusicLoadSuccess(musics));
    } catch (_) {
      emit(MusicLoadFailure());
    }
  }

  Future<List<String>> _fetchMusic() async {
    // Simulando uma chamada de rede com um atraso
    await Future.delayed(Duration(seconds: 2));
    return ['Song 1', 'Song 2', 'Song 3'];
  }
}
