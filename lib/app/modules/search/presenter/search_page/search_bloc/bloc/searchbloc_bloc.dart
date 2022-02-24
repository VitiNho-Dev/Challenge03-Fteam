import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';

import 'package:weather_forecast_bloc_app/app/modules/search/domain/usecases/search_by_text.dart';

part 'searchbloc_event.dart';
part 'searchbloc_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchByText usecase;

  SearchBloc(this.usecase) : super(SearchInitial()) {
    on<SearchTextEvent>(getText);
  }

  getText(SearchTextEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await usecase.call(event.searchText!);
    emit(result.fold((l) => SearchError(), (r) => SearchSuccess(r)));
  }
}
