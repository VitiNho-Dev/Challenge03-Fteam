import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';

abstract class SearchDatasource {
  Future<ResultSearch> getSearch(String searchText);
}
