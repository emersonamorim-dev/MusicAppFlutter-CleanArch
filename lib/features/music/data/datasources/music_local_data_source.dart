import 'package:musicflutterapp/features/music/domain/entities/music.dart';

class MusicLocalDataSource {
  Future<List<Music>> getMusics() async {
    // Imagine que esses dados venham de um banco de dados local ou cache
    return [
      Music(
          title: 'Pearl Jam - Even Flow',
          trackCount: 5,
          isHiFi: true,
          audioUrl: 'https://example.com/track1.mp3'),
      Music(
          title: 'Neil Young - Rockin In The Free World',
          trackCount: 6,
          isHiFi: true,
          audioUrl: 'https://example.com/track2.mp3'),
      Music(
        title: 'Bruce Springsteen - Born in the U.S.A.',
        trackCount: 7,
        isHiFi: true,
        audioUrl: 'http://example.com/feelthegroove.mp3',
      ),
      Music(
        title: 'Chuck Berry - Johnny B. Goode',
        trackCount: 8,
        isHiFi: true,
        audioUrl: 'http://example.com/feelthegroove.mp3',
      ),
      Music(
        title: 'Nirvana - The Man Who Sold The World',
        trackCount: 9,
        isHiFi: true,
        audioUrl: 'http://example.com/feelthegroove.mp3',
      ),
    ];
  }
}
