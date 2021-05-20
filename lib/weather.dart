import 'package:ui_1/Location.dart';
import 'package:ui_1/Networking.dart';

class WeatherModel{

  Future<dynamic> getCityWeather(String cityName) async{
    Network network = Network("https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=42dad65e970edd5be6e39e5167698b4d");
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
  Location location = Location();
  await location.getCurrentLocation();

  Network network = Network('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=42dad65e970edd5be6e39e5167698b4d');
  var weatherData = await network.getData();
  return weatherData;
}
}