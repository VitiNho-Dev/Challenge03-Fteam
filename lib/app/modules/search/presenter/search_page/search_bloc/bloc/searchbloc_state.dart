part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchSuccess extends SearchState {
  final ResultSearch resultSearch;

  SearchSuccess(this.resultSearch);
}

class SearchLoading extends SearchState {}

class SearchError extends SearchState {}
