import 'package:flutter/material.dart';

import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';

class CustomForecastCard extends StatelessWidget {
  const CustomForecastCard({
    Key? key,
    required this.resultSearch,
  }) : super(key: key);

  final ResultSearch resultSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 3,
              color: Colors.black54,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(resultSearch.day),
            Text(resultSearch.temperature),
            Text(resultSearch.wind),
          ],
        ),
      ),
    );
  }
}
