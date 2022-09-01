import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Screns/Search_page.dart';
import 'package:weatherapp/provider/Weather_provider.dart';

import '../Models/Weather_model.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weathe App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        "Ther is no Weather 😋",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(" Start searching Now 🥤 ",
                          style: TextStyle(fontSize: 25)),
                    ],
                  )),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Provider.of<WeatherProvider>(context)
                    .weatherData!
                    .getThemeColor(),
                Provider.of<WeatherProvider>(context)
                    .weatherData!
                    .getThemeColor()[200]!,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .cityName,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " updated : ${Provider.of<WeatherProvider>(context).weatherData!.date.hour}: ${Provider.of<WeatherProvider>(context).weatherData!.date.minute}",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 55,
                        ),
                        Image.asset(
                            '${Provider.of<WeatherProvider>(context).weatherData!.getImage()}'),
                        const SizedBox(
                          width: 55,
                        ),
                        Text(
                          "${Provider.of<WeatherProvider>(context).weatherData!.temp}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 55,
                        ),
                        Column(
                          children: [
                            Text(
                              'max:${Provider.of<WeatherProvider>(context).weatherData!.maxtemp.toInt()}',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "min:${Provider.of<WeatherProvider>(context).weatherData!.mintemp.toInt()}.",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text(
                      Provider.of<WeatherProvider>(context)
                          .weatherData!
                          .weatherStateName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
