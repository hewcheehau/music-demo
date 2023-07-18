import 'package:get_it/get_it.dart';
import 'package:music_demo/core/constants/url_constants.dart';
import 'package:music_demo/data/dio_client.dart';

GetIt sl = GetIt.instance;

Future<void> startup() async {
  
  /// Dio instance
  sl.registerSingleton<DioClient>(DioClient.init(UrlConstants.baseSearchUrl));
  
}
