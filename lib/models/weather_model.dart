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
    var jsonData = data["forecast"]["forecastday"][0];
// use facyory constructor to change normal constructor to constructor return object .
    return WeatherModel(
        date: data["location"]['localtime'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        miniTemp: jsonData['mintemp_c'],
        WeatherStateName: jsonData['condition']["text"]);
  }
}
