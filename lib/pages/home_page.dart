import 'package:flutter/material.dart';
import 'package:weatheer_app/models/weather_model.dart';
import 'package:weatheer_app/pages/searchScreen.dart';

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
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text('Cairo',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  Text(
                    'update:5-5-2023',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('lib/assets/images/clear.png'),
                      Text(
                        '30',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [Text('MaxTemp:30'), Text('MiniTemp:20')],
                      ),
                    ],
                  ),
                  Spacer(),
                  Text('Clear',
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
