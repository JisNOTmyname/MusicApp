import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _Playlist = [
    Song(
        songName: "Jealousy N Joy",
        artistName: "REDACTED",
        albumArtImagePath: "assets/images/image2.jpg",
        audioPath: "audio/jealousy_N_Joy.mp3"),
    Song(
        songName: "Jealousy N Joy 2",
        artistName: "REDACTED",
        albumArtImagePath: "assets/images/image3.jpg",
        audioPath: "audio/jealousy_N_Joy.mp3"),
    Song(
        songName: "Jealousy N Joy 3",
        artistName: "REDACTED",
        albumArtImagePath: "assets/images/image1.jpg",
        audioPath: "audio/jealousy_N_Joy.mp3"),
  ];

  int? _currentSongIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // Play the current song
  void play() async {
    final String path = _Playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play new song

    _isPlaying = true;
    notifyListeners();
  }

  // Pause the current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Resume the current song
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Pause or resume the current song
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // Seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _Playlist.length - 1) {
        // Go to next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // Loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  // Play previous song
  void playPreviousSong() async {
    // If more than 2 seconds, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      // If it's within 2 seconds, go to the previous song
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // If it's the first song, loop to the last song
        currentSongIndex = _Playlist.length - 1;
      }
    }
    notifyListeners();
  }

  // Listen to duration changes
  void listenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Getter methods
  List<Song> get playlist => _Playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Setter for currentSongIndex
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

  // Dispose audio player when not needed
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
