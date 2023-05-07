import 'package:flutter/material.dart';
import 'package:weatheer_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    //اي احد بيسمع الكود دا هيحصله ريبللد لل ui
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
