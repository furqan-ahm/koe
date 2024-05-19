import 'package:get/get.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class SongModel extends GetxController {
  static final Map<String, WeakReference<SongModel>> _songsDynamicCache = {};

  static SongModel cacheSong(SongModel song) {
    SongModel? cachedSong = _songsDynamicCache[song.videoId]?.target;
    if (cachedSong != null) {
      // cachedSong.updateModal(song);
      return cachedSong;
    } else {
      _songsDynamicCache[song.videoId] = WeakReference(song);
      return song;
    }
  }

  String title;
  String videoId;
  String url;
  Duration? duration;
  String? path;
  String thumbnailMed;
  String thumbnailMax;
  String? offlineThumbnail;

  late Uri audioUri;

  bool get isOffline => path != null;

  SongModel({
    required this.videoId,
    required this.url,
    required this.title,
    required this.thumbnailMed,
    required this.thumbnailMax,
    required this.duration,
    this.path,
    this.offlineThumbnail,
  });

  static SongModel fromVideo(Video vid) {
    return cacheSong(SongModel(
      title: vid.title,
      videoId: vid.id.toString(),
      url: vid.url,
      thumbnailMed: vid.thumbnails.mediumResUrl,
      thumbnailMax: vid.thumbnails.highResUrl,
      duration: vid.duration,
    ));
  }

  String get length {
    int seconds = duration == null ? 0 : duration!.inSeconds;
    int minutes = seconds ~/ 60;
    int hours = minutes ~/ 60;

    seconds = seconds % 60;
    minutes = minutes % 60;
    hours = hours;

    final result =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    if (hours != 0) return '${hours.toString().padLeft(2, '0')}:$result';

    return result;
  }

  static SongModel fromMap(Map data) {
    return cacheSong(SongModel(
        videoId: data['id'],
        path: data['path'],
        url: data['url'],
        title: data['title'],
        thumbnailMed: data['thumbnailMed'],
        thumbnailMax: data['thumbnailMax'],
        offlineThumbnail: data['offlineThumbnail'],
        duration: Duration(
          milliseconds: data['duration'],
        )));
  }

  toMap() {
    return {
      'id': videoId,
      'url': url,
      'path': path,
      'title': title,
      'thumbnailMed': thumbnailMed,
      'thumbnailMax': thumbnailMax,
      'offlineThumbnail': offlineThumbnail,
      'duration': duration!.inMilliseconds
    };
  }





  
}
