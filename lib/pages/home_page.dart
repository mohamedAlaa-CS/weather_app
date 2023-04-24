import 'package:flutter/material.dart';
import 'package:weatheer_app/pages/searchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchScreen();
                }));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
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
      ),
    );
  }
}
