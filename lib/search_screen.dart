import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_1/Weather_page.dart';
import 'package:ui_1/weather.dart';

import 'Error_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String cityName;

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
              Text('Search Weather',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w400,color: Colors.blueGrey[500]),),
              Text('Instanly',style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w300,color: Colors.blueGrey[500]),),
              Padding(
                padding: EdgeInsets.only(left: 35.0,right: 35.0,top: 30.0),
                child: TextField(
                  style: TextStyle(color: Colors.blueGrey[500], fontSize: 20.0),
                  decoration: InputDecoration(
                    hintText: 'Lucknow',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey[700], fontSize: 20.0, fontWeight: FontWeight.w300
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.blueGrey[700]),
                  ),
                  onChanged: (value){
                      cityName = value;
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              RaisedButton(
                onPressed: () async{
                  var weatherData = await WeatherModel().getCityWeather(cityName);
                  if(weatherData != null){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return WeatherPage(locationWeather: weatherData);
                        }));
                  }
                  else{
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ErrorPage();
                      }));
                  }
                  },
                color: Colors.blueGrey[500],
                child: Text('Get Weather',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400,color: Colors.black),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
