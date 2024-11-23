import 'dart:io';
import 'package:open_player/presentation/common/widgets/quality_badge/quality_badge_widget.dart';


class AudioModel {
  final String title;
  final String artists;
  final String album;
  final List<String> genre;
  final String ext;
  final String path;
  final int size;
  final int? bitrate;
  final List thumbnail;
  final String? lyrics;
  final int? sampleRate;
  final String? language;
  final DateTime? year;
  final File file;
  final Quality quality;

  AudioModel({
    required this.title,
    required this.ext,
    required this.path,
    required this.size,
    required this.thumbnail,
    required this.artists,
    required this.album,
    required this.genre,
    required this.bitrate,
    required this.lyrics,
    required this.sampleRate,
    required this.language,
    required this.year,
    required this.file,
    required this.quality,
  });

  bool matchesSearch(String query) {
    return title.toLowerCase().contains(query) ||
        artists.toLowerCase().contains(query) ||
        album.toLowerCase().contains(query) ||
        genre.any((g) => g.toLowerCase().contains(query));
  }
}
