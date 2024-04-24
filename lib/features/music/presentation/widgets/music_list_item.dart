import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicflutterapp/features/music/data/models/music.dart';

class MusicListItem extends StatefulWidget {
  final Music music;
  final bool isCurrentlyPlaying;
  final Function(String) onTapped;

  const MusicListItem({
    super.key,
    required this.music,
    this.isCurrentlyPlaying = false,
    required this.onTapped,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MusicListItemState createState() => _MusicListItemState();
}

class _MusicListItemState extends State<MusicListItem> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color pastelGreen = Color.fromARGB(255, 250, 223, 20);

    return ListTile(
      leading: Icon(
        widget.isCurrentlyPlaying
            ? Icons.pause_circle_filled
            : Icons.play_circle_fill,
        color: pastelGreen,
      ),
      title: Text(
        widget.music.title,
        style: const TextStyle(color: pastelGreen),
      ),
      subtitle: Text(
        '${widget.music.trackCount} Faixas ${widget.music.isHiFi ? "(Hi-Fi)" : ""}',
        style: const TextStyle(color: pastelGreen),
      ),
      trailing: const Icon(Icons.more_vert, color: pastelGreen),
      onTap: () {
        widget.onTapped(widget.music.audioUrl);
      },
    );
  }
}
