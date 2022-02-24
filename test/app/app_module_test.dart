import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:weather_forecast_bloc_app/app/app_module.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/usecases/search_by_text.dart';

import 'modules/search/utils/weather_api_result.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final _requestOptions = RequestOptions(path: '');

  setUp(() {
    initModule(AppModule(), replaceBinds: [
      Bind.instance<Dio>(dio),
    ]);
  });

  test('Deve recuperar um usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByText>());
  });

  test('Deve trazer uma lista de ResultSearch', () async {
    when(() => dio.get(any())).thenAnswer(
      (_) async => Response(
        requestOptions: _requestOptions,
        data: jsonDecode(weatherApiResult),
      ),
    );
  });
}
