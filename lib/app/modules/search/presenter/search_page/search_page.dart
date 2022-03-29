import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/presenter/search_page/search_controller/search_controller.dart';
import 'package:weather_forecast_bloc_app/app/modules/search/presenter/search_page/widgets/custom_app_bar.dart';
import 'package:weather_forecast_bloc_app/app/theme/app_colors.dart';

import 'search_bloc/bloc/searchbloc_bloc.dart';
import 'widgets/custom_forecast_card.dart';
import 'widgets/custom_primary_card.dart';
import 'widgets/custom_text_field.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final bloc = Modular.get<SearchBloc>();
  final searchController = SearchController();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? _searchText;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const CustomAppBar(text: 'Weather Forecast'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.07),
              CustomTextField(
                controller: controller,
                onChanged: (value) {
                  _searchText = value;
                },
                onPressed: () {
                  bloc.add(SearchTextEvent(_searchText));
                  controller.clear();
                },
              ),
              SizedBox(height: size.height * 0.05),
              BlocBuilder<SearchBloc, SearchState>(
                bloc: bloc,
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return const Center();
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
                  return Column(
                    children: [
                      CustomPrimaryCard(
                        description: result.description,
                        temperature: result.temperature,
                        wind: result.wind,
                      ),
                      SizedBox(height: size.height * 0.18),
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: result.forecast.length,
                        itemBuilder: (context, index) {
                          final forecastResult = result.forecast[index];
                          return CustomForecastCard(
                            day: forecastResult.day,
                            temperature: forecastResult.temperature,
                            wind: forecastResult.wind,
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
