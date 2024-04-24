import 'package:musicflutterapp/features/music/data/datasources/music_local_data_source.dart';
import 'package:musicflutterapp/features/music/domain/repositories/music_repository.dart';
import 'package:musicflutterapp/features/music/domain/entities/music.dart';

class MusicRepositoryImpl implements MusicRepository {
  final MusicLocalDataSource localDataSource;

  MusicRepositoryImpl(this.localDataSource);

  @override
  Future<List<Music>> fetchMusics() async {
    return localDataSource.getMusics();
  }
}
