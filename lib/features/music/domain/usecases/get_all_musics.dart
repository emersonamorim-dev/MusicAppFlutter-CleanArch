import 'package:musicflutterapp/features/music/domain/entities/music.dart';
import 'package:musicflutterapp/features/music/domain/repositories/music_repository.dart';

class GetAllMusics {
  final MusicRepository repository;

  GetAllMusics(this.repository);

  Future<List<Music>> call() async {
    return await repository.fetchMusics();
  }
}
