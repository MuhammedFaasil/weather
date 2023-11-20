import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_ui_1/view/services/weather_services.dart';

final getWeatherProvider = FutureProvider(
  (ref) => ApiServices.getWeather(),
);
