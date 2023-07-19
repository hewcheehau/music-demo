part of 'search_bloc.dart';

enum SearchStatus {
  searching, done, idle, fail, empty
}

class SearchState extends Equatable {
  const SearchState({this.data = const [], this.status = SearchStatus.idle, this.itemCount = -1});
  final SearchStatus status;
  final List<MusicItem> data;
  final int itemCount;

  SearchState copyWith({
    SearchStatus? status,
    List<MusicItem>? data,
    int? itemCount,
  }) {
    return SearchState(status: status ?? this.status, data: data ?? this.data, itemCount: itemCount ?? this.itemCount);
  }

  @override
  List<Object> get props => [status, data, itemCount];
}
