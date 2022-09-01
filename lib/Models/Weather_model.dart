import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherStateName;
  String icon;
  String cityName;

  WeatherModel(
      {required this.cityName,
      required this.icon,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: DateTime.parse(data['current']['last_updated']),
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text'],
        cityName: data['location']['name'],
        icon: data['current']['condition']['icon']);
  }

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Sunny' || weatherStateName == 'light Cloude') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return Colors.cyan;
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return Colors.lightBlue;
    } else {
      return Colors.blue;
    }
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'light Cloude') {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Showers' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Light Rain') {
      return 'assets/images/rainy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
