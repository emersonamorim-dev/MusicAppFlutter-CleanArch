class Music {
  final String title;
  final int trackCount;
  final bool isHiFi;
  final String audioUrl;

  Music({
    required this.title,
    this.trackCount = 0,
    this.isHiFi = false,
    required this.audioUrl,
  });
}
