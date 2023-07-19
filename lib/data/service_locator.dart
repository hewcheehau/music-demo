import 'package:get_it/get_it.dart';
import 'package:music_demo/core/constants/url_constants.dart';
import 'package:music_demo/core/utils/app_router.dart';
import 'package:music_demo/data/dio_client.dart';
import 'package:music_demo/data/search_service.dart';
import 'package:music_demo/domain/search_repository.dart';

GetIt sl = GetIt.instance;

Future<void> startup() async {
  sl.registerSingleton<AppRouter>(AppRouter());

  /// Dio instance
  sl.registerSingleton<DioClient>(DioClient.init(UrlConstants.baseSearchUrl));

  sl.registerSingleton<SearchService>(SearchService());
  sl.registerSingleton<SearchRepository>(SearchImplRepository(sl()));
}
