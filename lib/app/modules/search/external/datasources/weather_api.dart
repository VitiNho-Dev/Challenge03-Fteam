import 'package:dio/dio.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/datasources/search_datasource.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/infra/models/result_search_model.dart';

class WeatherApi implements SearchDatasource {
  final Dio dio;

  WeatherApi(this.dio);

  @override
  Future<ResultSearchModel> getSearch(String searchText) async {
    final response =
        await dio.get('https://goweather.herokuapp.com/weather/$searchText');
    ResultSearchModel resultSearchModel =
        ResultSearchModel.fromJson(response.data);
    return resultSearchModel;
  }
}
