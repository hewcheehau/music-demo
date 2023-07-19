import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_demo/data/service_locator.dart';
import 'package:music_demo/domain/search_repository.dart';
import 'package:music_demo/feature/search/model/music_item.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchByKeyword>(_onSearchByKeyword);
  }

  final SearchRepository _searchRepository = sl<SearchRepository>();

  _onSearchByKeyword(
      SearchByKeyword event, Emitter<SearchState> emitter) async {
    emitter(state.copyWith(status: SearchStatus.searching));
    try {
      final response = await _searchRepository.search(keywords: event.text);
      if (response is ({int count, List<MusicItem> data})) {
        return emitter(state.copyWith(
            data: response.data,
            itemCount: response.count,
            status: SearchStatus.done));
      }
      emitter(state.copyWith(status: SearchStatus.empty, data: [], itemCount: 0));
    } catch (e) {
      debugPrint(e.toString());
      emitter(state.copyWith(status: SearchStatus.fail));
    }
  }
}
