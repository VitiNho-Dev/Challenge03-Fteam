import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/search/domain/usecases/search_by_text.dart';
import 'modules/search/external/datasources/weather_api.dart';
import 'modules/search/infra/repositories/search_repository_impl.dart';
import 'modules/search/presenter/search_page/search_bloc/bloc/searchbloc_bloc.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(((i) => Dio())),
        Bind.factory(((i) => WeatherApi(i()))),
        Bind.factory(((i) => SearchRepositoryImpl(i()))),
        Bind.factory(((i) => SearchByTextImpl(i()))),
        Bind.factory(((i) => SearchBloc(i()))),
      ];

  @override
  List<ModularRoute> get routes => [];
}
