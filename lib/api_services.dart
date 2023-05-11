import 'dart:convert';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'package:get/get.dart';

class ApiServices extends GetxController {
  static var cityName;
  static var stateName;
  Rx<dynamic> lat = "35.7796".obs;
  Rx<dynamic> long = "78.6382".obs;

  Future<dynamic> fetchnews() async {
    var result;
    final responce = await http.get(Uri.parse(
        // "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}"
        // "https://api.weatherbit.io/v2.0/current?lat=11.6692&lon=79.7479&key=57c14a4826a24204a177ec3c8ba21d7b&include=minutely"
        // "https://api.weatherbit.io/v2.0/current?lat=35.7796&lon=-78.6382&key=57c14a4826a24204a177ec3c8ba21d7b&include=minutely"
        "https://api.weatherbit.io/v2.0/forecast/daily?lat=${lat.value}&lon=${long.value}&key=4deb2b9897d740daa914ace91927ecb9&include=hourly"));
    if (responce.statusCode == 200) {
      result = await jsonDecode(responce.body)["data"];
      print(result);
      return result;
    } else {
      print("Faild");
      return "not";
    }
  }

  Future<dynamic> titlefetchnews() async {
    final responce = await http.get(Uri.parse(
        // "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}"
        // "https://api.weatherbit.io/v2.0/current?lat=11.6692&lon=79.7479&key=57c14a4826a24204a177ec3c8ba21d7b&include=minutely"
        // "https://api.weatherbit.io/v2.0/current?lat=35.7796&lon=-78.6382&key=57c14a4826a24204a177ec3c8ba21d7b&include=minutely"
        "https://api.weatherbit.io/v2.0/forecast/daily?lat=35.7796&lon=-78.6382&key=57c14a4826a24204a177ec3c8ba21d7b&include=hourly"));
    if (responce.statusCode == 200) {
      cityName = await jsonDecode(responce.body)["city_name"];

      stateName = await jsonDecode(responce.body)["country_code"];
      // print(result);
      //  = result[1];
      return cityName;
    } else {
      print("Failer");
      return "not";
    }
    // print(result);
    // return result;
  }
}
