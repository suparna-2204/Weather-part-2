import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/search_screen.dart';
import 'package:ui_1/weather.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void getLocation() async{
    await WeatherModel().getLocationWeather();
    Navigator.push(context,
    MaterialPageRoute(builder: (context) {
      return SearchScreen();
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.blueGrey[500],
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
