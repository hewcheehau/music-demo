import 'package:music_demo/core/utils/type_def.dart';
import 'package:music_demo/data/dio_client.dart';
import 'package:music_demo/data/dio_response.dart';
import 'package:music_demo/data/service_locator.dart';

class SearchService {

  final dioClient = sl<DioClient>();
  Future<DioResponse> searchByKeywords({required Jmap params}) async {
    final response = await dioClient.get("search", queryParameters: params);
    return response;
  }
}