import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/errors/failure_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/models/result_search_model.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/repositories/search_repository_impl.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

class ResultSearchModelMock extends Mock implements ResultSearchModel {}

void main() {
  final datasource = SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);
  final resultSearchModelMock = ResultSearchModelMock();

  test('Deve retornar uma lista de ResultSearch', () async {
    when(() => datasource.getSearch(any()))
        .thenAnswer((_) async => resultSearchModelMock);
    final result = await repository.search('Curitiba');
    expect(result.fold(id, id), isA<ResultSearch>());
  });

  test('Deve retornar um DatasourceError se o datasource falhar', () async {
    when(() => datasource.getSearch(any())).thenThrow(Exception());
    final result = await repository.search('Curitiba');
    expect(result.fold(id, id), isA<DatasourceError>());
  });
}
