// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Models/Weather_model.dart';
import 'package:weatherapp/provider/Weather_provider.dart';
import 'package:weatherapp/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});
  String? CityName;
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search a City")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: TextField(
            onChanged: (data) {
              CityName = data;
            },
            onSubmitted: (data) async {
              CityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
                  await service.getWeather(CityName: CityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              label: Text('Search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                        await service.getWeather(CityName: CityName!);
                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: "Enter city",
            ),
          ),
        ),
      ),
    );
  }
}
