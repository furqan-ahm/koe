import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YTService {
  YTService._();
  final YTService _instance = YTService._();
  YTService get instance => _instance;

  final YoutubeExplode _yt = YoutubeExplode();

  Future<VideoSearchList> getSearchResults(String query) async {
    return _yt.search(query, filter: TypeFilters.video);
  }
}
