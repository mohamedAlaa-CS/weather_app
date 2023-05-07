// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weatheer_app/models/weather_model.dart';
import 'package:weatheer_app/provider/weatherProvider.dart';
import 'package:weatheer_app/services/weather_service.dart';

class searchScreen extends StatelessWidget {
  String? CityName;
  searchScreen({this.updateui});
  VoidCallback? updateui;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            // to use data which enter can you use tow
            //1- on change(){}
            // 2- onSubmitted: (){} بيستقبل الداتا مره واحده بس بعد مااليويز يعمل submit
            onSubmitted: (data) async {
              CityName = data;
              weatherService service = weatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  CityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              border: OutlineInputBorder(),
              labelText: 'search',
              hintText: 'Enter City Name',
              suffixIcon: GestureDetector(
                  onTap: () async {
                    weatherService service = weatherService();
                    WeatherModel weather =
                        await service.getWeather(cityName: CityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = CityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
            ),
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherData;
