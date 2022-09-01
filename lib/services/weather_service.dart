import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/Models/Weather_model.dart';

class WeatherService {
  Future<WeatherModel> getWeather({required String CityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          "http://api.weatherapi.com/v1/forecast.json?key=d6ecfb007fdb47ba88d202842221408&q=$CityName&aqi=yes");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = WeatherModel.fromJson(data);
    } catch (ex) {
      print(ex);
    }
    return weather!;
  }
}
