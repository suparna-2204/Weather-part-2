import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/weather.dart';

void main() {
  runApp(
      MaterialApp(
        home: WeatherPage(),
      )
  );
}

class WeatherPage extends StatefulWidget {
  WeatherPage({this.locationWeather});
  final locationWeather;

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double temperature,windSpeed,tempMax,tempMin;
  String weather,city;
  int humidity;
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    ui(widget.locationWeather);
  }

  void ui(dynamic totalWeather){
    setState(() {
        temperature = totalWeather['main']['temp'];
        weather = totalWeather['weather'][0]['description'];
        humidity = totalWeather['main']['humidity'];
        windSpeed = totalWeather['wind']['speed'];
        tempMax = totalWeather['main']['temp_max'];
        tempMin = totalWeather['main']['temp_min'];
        city = totalWeather['name'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
              height: 40.0,
              ),
              Text('Currently in $city',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w500,color: Colors.blueGrey[700]),),
              SizedBox(
                height: 10.0,
              ),
              Text('$temperature',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w300,color: Colors.blueGrey[700]),),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.wb_sunny,color: Colors.yellowAccent[700],size: 23.0,),
                            SizedBox(height: 15.0,),
                            Icon(Icons.cloud,color: Colors.grey,size: 23.0,),
                            SizedBox(height: 15.0,),
                            Icon(Icons.grain,color: Colors.blue,size: 23.0,),
                            SizedBox(height: 15.0,),
                            Icon(Icons.flag,color: Colors.blue,size: 23.0,),
                            SizedBox(height: 15.0,),
                            Icon(Icons.brightness_7,color: Colors.yellowAccent[700],size: 23.0,),
                            SizedBox(height: 15.0,),
                            Icon(Icons.brightness_5_sharp,color: Colors.yellowAccent[700],size: 23.0,),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Temperature',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('Weather',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('Humidity',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('Wind Speed',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('Temp Max',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('Temp Min',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('$temperature F',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('$weather',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('$humidity%',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('$windSpeed m/s',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('$tempMax F',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                            SizedBox(height: 15.0,),
                            Text('$tempMin F',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal,color: Colors.grey[700]),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


