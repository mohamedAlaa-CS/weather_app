import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatheer_app/models/weather_model.dart';
import 'package:weatheer_app/pages/home_page.dart';
import 'package:weatheer_app/provider/weatherProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
