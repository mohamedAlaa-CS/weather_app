import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add'),
      ]),
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
