import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/weather_service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherservice = WeatherService('75f11fcac4deaedcdb88ef380ea4ae79');
  Weather? _weather;
  _fetchweather() async{
    String cityName = await _weatherservice.getCurrentCity();

    try {
      final weather = await _weatherservice.getWeather(cityName);
      setState(() {
        _weather = weather;
      });

    }
    catch (e) {
      print (e);
    }}
    void initState() {
      super.initState();
      _fetchweather();
    }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(_weather?.cityName ?? "loading city"),
   Text('${_weather?.temperature.round()}°C')

    ],
  ),
);

  }
}