class Music {
  final String title;
  final int trackCount;
  final bool isHiFi;
  final String audioUrl;

  Music(
      {required this.title,
      this.trackCount = 0,
      this.isHiFi = false,
      required this.audioUrl});
}

final List<Music> musics = [
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
