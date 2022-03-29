import 'package:flutter/material.dart';
import 'package:weather_forecast_bloc_app/app/theme/app_colors.dart';

class AppTextStyle {
  static const _headline4 = TextStyle(
    fontFamily: 'Nunito',
    color: AppColors.textColor,
    fontSize: 34,
    fontWeight: FontWeight.w400,
  );

  static const _headline5 = TextStyle(
    fontFamily: 'NunitoSans',
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const _headline6 = TextStyle(
    fontFamily: 'NunitoSans',
    color: AppColors.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final _subtitle2 = TextStyle(
    fontFamily: 'Nunito',
    color: AppColors.textColor.withOpacity(0.75),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final _body2 = TextStyle(
    fontFamily: 'Nunito',
    color: AppColors.textColor.withOpacity(0.75),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static final textTheme = TextTheme(
    headline4: _headline4,
    headline5: _headline5,
    headline6: _headline6,
    subtitle2: _subtitle2,
    bodyText2: _body2,
  );
}
