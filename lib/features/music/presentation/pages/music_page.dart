// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, library_private_types_in_public_api, unused_element, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:musicflutterapp/features/music/data/models/music.dart';
import 'package:musicflutterapp/features/music/presentation/widgets/music_list_item.dart';
import 'package:musicflutterapp/features/music/presentation/pages/setlists_page.dart';
import 'package:musicflutterapp/features/music/presentation/pages/profile_page.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_sound/flutter_sound.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    var hasPermission = await Permission.microphone.request();
    if (hasPermission != PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão de microfone não concedida')),
      );
      return;
    }

    try {
      await _audioRecorder.openAudioSession();
      setState(() {
        // Atualiza a UI para refletir que o gravador está pronto para uso
      });
    } catch (e) {
      print('Falha ao abrir sessão de áudio: $e');
    }
  }

  Future<void> startRecording() async {
    if (!_audioRecorder.isRecording) {
      await _audioRecorder.startRecorder(toFile: 'audio_record.aac');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gravação iniciada')),
      );
    } else {
      print('Gravador não inicializado');
    }
  }

  Future<void> _stopRecording() async {
    if (_audioRecorder.isRecording) {
      final path = await _audioRecorder.stopRecorder();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gravação salva em $path')),
      );
    } else {
      print('O gravador não estava gravando');
    }
  }

  Future<void> addMusic() async {
    final FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null) {
      String? filePath = result.files.single.path;
      if (filePath != null) {
        print('Adicionando arquivo de música: $filePath');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Arquivo de música adicionado: $filePath')),
        );
        // Optionally play the music file
        await _audioPlayer.play(filePath, isLocal: true);
      }
    } else {
      print('Nenhum arquivo selecionado.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nenhum arquivo selecionado')),
      );
    }
  }

  String _currentPlayingUrl = "";
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  List<Widget> get _pages => [
        MusicListView(),
        const SetlistsPage(),
        const ProfilePage(),
      ];

  Future<void> _playMusic(String url) async {
    if (_currentPlayingUrl == url) {
      await _audioPlayer.pause();
      setState(() => _currentPlayingUrl = "");
    } else {
      int result = await _audioPlayer.play(url);
      if (result == 1) {
        setState(() => _currentPlayingUrl = url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Erro ao reproduzir áudio.")));
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pageController.dispose();
    _searchController.dispose();
    _audioRecorder.closeAudioSession();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : const Text('Music App'),
        actions: [
          if (!_isSearching)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: _toggleSearch,
            ),
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: _toggleSearch,
            ),
        ],
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _pages,
      ),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget MusicListView() {
    const Color pastelGreen = Colors.amber;
    return ListView.separated(
      itemCount: musics.length,
      itemBuilder: (context, index) {
        final music = musics[index];
        return MusicListItem(
          music: music,
          isCurrentlyPlaying: _currentPlayingUrl == music.audioUrl,
          onTapped: (url) => _playMusic(url),
        );
      },
      separatorBuilder: (context, index) =>
          Divider(color: pastelGreen.withOpacity(0.5)),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Pesquise...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (value) {
        //
      },
    );
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }

  SpeedDial _buildFloatingActionButton() {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      backgroundColor: Colors.amber,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.mic, color: Colors.white),
          backgroundColor: Colors.red,
          label: 'Gravar',
          onTap: () async {
            if (_audioRecorder.isRecording) {
              await _stopRecording();
            } else {
              await startRecording();
            }
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.music_note, color: Colors.white),
          backgroundColor: Colors.green,
          label: 'Add Música',
          onTap: () async {
            await addMusic();
          },
        ),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey.shade600,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: 'Músicas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.queue_music),
          label: 'Setlists',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      onTap: (index) {
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
