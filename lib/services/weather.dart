import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  Future<dynamic> getGps() async {
    Location gps = new Location();
    await gps.getLocation();
    NetworkingHelper help = new NetworkingHelper(
        Link:
            'https://api.openweathermap.org/data/2.5/weather?lat=${gps.Latitude}&lon=${gps.Longitude}&appid=2ec762e21acd348b85c32e9a70b7469b&units=metric');
    var weatherData = await help.getData();
    return weatherData;
  }

  Future<dynamic> getcityweather({required String cityname}) async {
    NetworkingHelper help = new NetworkingHelper(
        Link:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=2ec762e21acd348b85c32e9a70b7469b&units=metric');
    var weatherData = await help.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
