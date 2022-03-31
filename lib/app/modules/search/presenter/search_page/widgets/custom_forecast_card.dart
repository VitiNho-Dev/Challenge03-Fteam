import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';

class CustomForecastCard extends StatelessWidget {
  final String day;
  final String temperature;
  final String wind;
  final String imageUrl;

  const CustomForecastCard({
    Key? key,
    required this.day,
    required this.temperature,
    required this.wind,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: AppColors.textColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            imageUrl,
            width: 32,
            height: 32,
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
