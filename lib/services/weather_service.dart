import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatheer_app/models/weather_model.dart';

class weatherService {
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '3bb25b765aa64660b6700716232404';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    var jsonData = data["forecast"]["forecastday"][0];

    WeatherModel weather = WeatherModel(
        date: data["location"]['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        miniTemp: jsonData['mintemp_c'],
        WeatherStateName: jsonData["condition"]['text']);

    return weather;
  }
}
