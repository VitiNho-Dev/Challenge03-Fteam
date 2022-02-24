import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/usecases/search_by_text.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/presenter/search_page/search_bloc/bloc/searchbloc_bloc.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final usecase = SearchByTextMock();

  const resultSearch = ResultSearch(
    description: 'lala',
    temperature: 'lalala',
    wind: 'lalasks',
    day: '2',
    forecast: [],
  );

  blocTest<SearchBloc, SearchState>(
    'Deve retornar os estados na ordem correta',
    build: () {
      when(() => usecase.call(any()))
          .thenAnswer((_) async => const Right(resultSearch));
      return SearchBloc(usecase);
    },
    act: (bloc) => bloc.add(SearchTextEvent("Vitinho")),
    expect: () => [
      isA<SearchLoading>(),
      isA<SearchSuccess>(),
    ],
  );
}
