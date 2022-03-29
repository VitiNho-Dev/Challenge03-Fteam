import 'package:flutter/material.dart';
import 'package:weather_forecast_bloc_app/app/theme/app_text_style.dart';

import 'modules/search/presenter/search_page/search_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTextStyle.textTheme,
      ),
      home: SearchPage(),
    );
  }
}
