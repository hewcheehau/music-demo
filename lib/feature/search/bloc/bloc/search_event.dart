part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}


class SearchByKeyword extends SearchEvent {
  final String text;

  const SearchByKeyword({required this.text});

  @override
  List<Object> get props => [text];
}
