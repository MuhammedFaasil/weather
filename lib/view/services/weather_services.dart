

import 'package:http/http.dart' as http;
import 'package:project_ui_1/view/model/weather_api.dart';
import 'package:project_ui_1/view/utility/weather_utility.dart';

class ApiServices {
  static final http.Client _client = http.Client();

  static Future<Temperatures?> getWeather() async {
    final link = Uri.parse(AppUrl.appUrl + AppUrl.postUrl);

    try {
      http.Response response = await _client.get(link);

      if (response.statusCode == 200) {
        return temperaturesFromJson(response.body);
      }
      return null;
    } catch (e) {
     
    }

    return null;
  }
}
