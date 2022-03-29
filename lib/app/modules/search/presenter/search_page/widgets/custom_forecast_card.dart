import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class CustomForecastCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String wind;

  const CustomForecastCard({
    Key? key,
    required this.day,
    required this.temperature,
    required this.wind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 23,
      ),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const FlutterLogo(
            size: 32,
          ),
          Column(
            children: [
              Text(day),
              Text(
                temperature,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(wind),
            ],
          ),
        ],
      ),
    );
  }
}
