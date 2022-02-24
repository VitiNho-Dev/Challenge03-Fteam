import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/external/datasources/weather_api.dart';

import '../../utils/weather_api_result.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = WeatherApi(dio);
  final _requestOptions = RequestOptions(path: '');

  test('Deve retornar uma lista de ResultSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        requestOptions: _requestOptions, data: jsonDecode(weatherApiResult)));
    final future = datasource.getSearch('Vitinho');
    expect(future, completes);
  });
}
