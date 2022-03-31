class SearchController {
  late String cityName;

  SearchController({
    this.cityName = '',
  });

  SearchController copyWith({
    String? cityName,
  }) {
    return SearchController(
      cityName: cityName ?? this.cityName,
    );
  }

  String getImage(String value) {
    if (value.contains('rain')) {
      return value = 'assets/icons/rain.png';
    }
    if (value.contains('cloudy')) {
      return value = 'assets/icons/cloudy-day.png';
    }
    if (value.contains('Sunny')) {
      return value = 'assets/icons/sun.png';
    }
    return r'';
  }
}
