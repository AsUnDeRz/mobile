import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

export 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ContentCacheManager extends BaseCacheManager {
  static const KEY = 'contentCache';

  static ContentCacheManager _instance;

  factory ContentCacheManager() {
    if (_instance == null) {
      _instance = new ContentCacheManager._();
    }
    return _instance;
  }

  ContentCacheManager._() : super(KEY,
      maxAgeCacheObject: Duration(hours: 1) ,
      maxNrOfCacheObjects: 20,
      fileFetcher: _contentFileFetcher);

  @override
  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    return path.join(directory.path, KEY);
  }

  static Future<FileFetcherResponse> _contentFileFetcher(String url, {Map<String, String> headers}) async {
    return HttpFileFetcherResponse(await http.get(url, headers: headers));
  }
}