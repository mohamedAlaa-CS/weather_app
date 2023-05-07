import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatheer_app/models/weather_model.dart';
import 'package:weatheer_app/pages/searchScreen.dart';
import 'package:weatheer_app/provider/weatherProvider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void updateui() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchScreen(
                    updateui: updateui,
                  );
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 27,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData!.getThemcolor(),
                    weatherData!.getThemcolor()[300]!,
                    weatherData!.getThemcolor()[100]!,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(Provider.of<WeatherProvider>(context).cityName!,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text(
                    'updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        '${weatherData!.temp.toInt()}',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text('maxTemp : ${weatherData!.maxtemp.toInt()}'),
                          Text('miniTemp :${weatherData!.miniTemp.toInt()} ')
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(weatherData!.WeatherStateName,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
