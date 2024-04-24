import 'package:musicflutterapp/features/music/domain/entities/music.dart';

abstract class MusicRepository {
  Future<List<Music>> fetchMusics();
}

class MusicRepositoryImpl implements MusicRepository {
  @override
  Future<List<Music>> fetchMusics() async {
    return <Music>[];
  }
}
