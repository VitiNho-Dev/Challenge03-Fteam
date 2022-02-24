import 'package:flutter/material.dart';

class SearchController {
  String getImage(String value) {
    if (value.contains('rain')) {
      return r'assets/day/rain.png';
    }
    if (value.contains('cloudy')) {
      return r'assets/day/cloudy.png';
    }
    if (value.contains('Sunny')) {
      return r'assets/day/eclipse.png';
    }
    return r'assets/celsius.png';
  }
}
