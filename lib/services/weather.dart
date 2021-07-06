import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5fe0b65a375f3483c9883d9578d1d9b6';
const openWeatherMapUrl = 'http://api.openweathermap.org';

//api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url =
        '$openWeatherMapUrl/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(urlString: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location getUserLocation = Location();
    await getUserLocation.getCurrentLocation();
    String url =
        '$openWeatherMapUrl/data/2.5/weather?lat=${getUserLocation.latitude}&lon=${getUserLocation.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(urlString: url);
    var weatherData = await networkHelper.getData();
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
