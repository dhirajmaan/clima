import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.urlString});
  final String urlString;

  Future getData() async {
    var url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
      // print(temperature);
      // print(condition);
      // print(cityName);
    } else {
      print(response.statusCode);
    }
  }
}
// 'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'
