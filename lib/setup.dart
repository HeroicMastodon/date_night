import 'package:date_night/restaurant_list_notifier.dart';
import 'package:date_night/restaurant_list_logic.dart';
import 'package:date_night/restaurant_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';


final services = GetIt.I;

setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  services.registerSingleton<RestaurantRepository>(RestaurantSharedPrefRepository(sharedPrefs));
  services.registerSingleton(await RestaurantListNotifier.initialize(services.get<RestaurantRepository>()));
  services.registerSingleton(RestaurantListLogic(services.get<RestaurantListNotifier>()));
}
