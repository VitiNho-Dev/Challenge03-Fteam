import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';

class ResultSearchMapper {
  static Map<String, dynamic> toMap(ResultSearch resultSearch) {
    return {
      'temperature': resultSearch.temperature,
      'wind': resultSearch.wind,
      'description': resultSearch.description,
      'forecast': resultSearch.forecast,
      'day': resultSearch.day,
    };
  }

  static ResultSearch fromJson(Map<String, dynamic> json) {
    return ResultSearch(
      temperature: json['temperature'] ?? '',
      wind: json['wind'] ?? '',
      description: json['description'] ?? '',
      forecast: json['forecast'] == null
          ? []
          : List<ResultSearch>.from(
              json['forecast'].map((e) => ResultSearchMapper.fromJson(e))),
      day: json['day'] ?? '',
    );
  }
}
