part of 'searchbloc_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchTextEvent implements SearchEvent {
  final String? searchText;

  SearchTextEvent(this.searchText);
}
