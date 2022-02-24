import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';
import 'package:dartz/dartz.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/errors/failure_search.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, ResultSearch>> call(String searchText);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, ResultSearch>> call(String searchText) async {
    if (searchText == '') {
      return Left(InvalidTextError());
    }

    return repository.search(searchText);
  }
}
