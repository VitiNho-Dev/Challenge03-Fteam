import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/repositories/search_repository.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/usecases/search_by_text.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByTextImpl(repository);

  const resultSearch = ResultSearch(
    description: 'lala',
    temperature: 'lalala',
    wind: 'lalasks',
    day: '2',
    forecast: [],
  );

  test('Deve retornar uma lista de SearchResult', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => const Right(resultSearch));
    final result = await usecase.call("Curitiba");
    expect(result.fold(id, id), isA<ResultSearch>());
  });

  test('Deve retornar um InvalidTextError caso o texto seja invalido',
      () async {
    when(() => repository.search(''))
        .thenAnswer((_) async => const Right(resultSearch));
    final result = await usecase.call('');
    expect(result.isLeft(), true);
  });
}
