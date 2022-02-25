import 'package:dio/dio.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/external/mappers/result_search_mapper.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/datasources/search_datasource.dart';

class WeatherApi implements SearchDatasource {
  final Dio dio;

  WeatherApi(this.dio);

  @override
  Future<ResultSearch> getSearch(String searchText) async {
    final response =
        await dio.get('https://goweather.herokuapp.com/weather/$searchText');
    ResultSearch resultSearchMapper =
        ResultSearchMapper.fromJson(response.data);
    return resultSearchMapper;
  }
}
