import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/presenter/search_page/search_controller/search_controller.dart';

import 'search_bloc/bloc/searchbloc_bloc.dart';
import 'widgets/custom_forecast_card.dart';
import 'widgets/custom_text_field.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final bloc = Modular.get<SearchBloc>();
  final searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    String? _searchText;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (value) {
                  _searchText = value;
                },
                onPressed: () {
                  bloc.add(SearchTextEvent(_searchText));
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<SearchBloc, SearchState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(
                      child: Image.asset(
                        'assets/celsius.png',
                        width: 80,
                        height: 80,
                      ),
                    );
                  }

                  if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is SearchError) {
                    return const Center(
                      child: Text('Houve um erro!!!'),
                    );
                  }

                  final result = (state as SearchSuccess).resultSearch;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset(
                            searchController.getImage(result.description),
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(result.description),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(result.wind),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            result.temperature,
                            style: const TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomForecastCard(
                                resultSearch: result.forecast[0]),
                            CustomForecastCard(
                                resultSearch: result.forecast[1]),
                            CustomForecastCard(
                                resultSearch: result.forecast[2]),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
