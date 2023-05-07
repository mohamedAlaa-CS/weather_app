class WeatherModel {
  String date;
  double temp;
  double maxtemp;
  double miniTemp;
  String WeatherStateName;

// defolt constructor
  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxtemp,
    required this.miniTemp,
    required this.WeatherStateName,
  });
//constractor used to data from api
  factory WeatherModel.fromjson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]['day'];
// use facyory constructor to change normal constructor to constructor return object .
    return WeatherModel(
      date: data["location"]['localtime'],
      temp: jsonData['avgtemp_c'],
      maxtemp: jsonData['maxtemp_c'],
      miniTemp: jsonData['mintemp_c'],
      WeatherStateName: jsonData['condition']["text"],
    );
  }
  String getImage() {
    if (WeatherStateName == 'Clear' || WeatherStateName == 'Light Cloud') {
      return 'lib/assets/images/clear.png';
    } else if (WeatherStateName == 'Snow' ||
        WeatherStateName == 'Hail' ||
        WeatherStateName == 'Sleet') {
      return 'lib/assets/images/snow.png';
    } else if (WeatherStateName == 'Heavy Cloud') {
      return 'lib/assets/images/cloudy.png';
    }
    if (WeatherStateName == 'Light Rain' ||
        WeatherStateName == 'Heavy Rain' ||
        WeatherStateName == 'Moderate rain' ||
        WeatherStateName == 'Patchy rain possible') {
      return 'lib/assets/images/rainy.png';
    } else if (WeatherStateName == 'Thunderstorm' ||
        WeatherStateName == 'Thunder') {
      return 'lib/assets/images/thunderstorm.png';
    } else {
      return 'lib/assets/images/clear.png';
    }
  }
}
