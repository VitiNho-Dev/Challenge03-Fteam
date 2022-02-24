import 'package:weather_forecast_bloc_app/app/modules/search/infra/models/result_search_model.dart';

abstract class SearchDatasource {
  Future<ResultSearchModel> getSearch(String searchText);
}
