import 'package:weather_forecast_bloc_app/app/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  set temperature(String value) => temperature = value;
  set wind(String value) => wind = value;
  set description(String value) => description = value;
  set forecast(List value) => forecast = value;
  set day(String value) => day = value;

  ResultSearchModel(
      {required String temperature,
      required String wind,
      required String description,
      required List<ResultSearch> forecast,
      required String day})
      : super(
            temperature: temperature,
            wind: wind,
            description: description,
            forecast: forecast,
            day: day);

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'wind': wind,
      'description': description,
      'forecast': forecast,
      'day': day,
    };
  }

  factory ResultSearchModel.fromJson(Map<String, dynamic> json) {
    return ResultSearchModel(
      temperature: json['temperature'] ?? '',
      wind: json['wind'] ?? '',
      description: json['description'] ?? '',
      forecast: json['forecast'] == null
          ? []
          : List<ResultSearch>.from(
              json['forecast'].map((e) => ResultSearchModel.fromJson(e))),
      day: json['day'] ?? '',
    );
  }
}
