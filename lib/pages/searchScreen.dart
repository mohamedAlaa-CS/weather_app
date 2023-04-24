import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class searchScreen extends StatelessWidget {
  String? CityName;

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
            // to use data which enter can you use tow
            //1- on change(){}
            // 2- onSubmitted: (){} بيستقبل الداتا مره واحده بس بعد مااليويز يعمل submit
            onSubmitted: (data) {
              CityName = data;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              border: OutlineInputBorder(),
              labelText: 'search',
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
