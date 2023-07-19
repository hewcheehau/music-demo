import 'dart:convert';

import 'package:music_demo/data/search_service.dart';
import 'package:music_demo/feature/search/model/music_item.dart';

abstract class SearchRepository {
  // Future<dynamic>searchAll();
  Future<dynamic> search({required String keywords, int limit});
}

class SearchImplRepository implements SearchRepository {
  final SearchService searchService;

  SearchImplRepository(this.searchService);

  @override
  Future search({required String keywords, int limit = 50}) async {
    final response = await searchService.searchByKeywords(
        params: {"term": keywords.replaceAll(" ", "+"), "limit": limit.toString()});
    if (response.isSuccess) {
      var data = jsonDecode(response.data);
      List rawData = data['results'] ?? []; 
      print(rawData);
      
      if (rawData.isNotEmpty) {
        return (data: rawData.map((e) => MusicItem.fromJson(e)).toList(), count: data['resultCount'] ?? 0);
      }
    }
    return -1;
  }
}
