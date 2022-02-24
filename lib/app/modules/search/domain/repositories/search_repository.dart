import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/errors/failure_search.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, ResultSearch>> search(String searchText);
}
