import 'package:shared_preferences/shared_preferences.dart';


class CacheHelper {
  static SharedPreferences? prefs;

  static initCache()async{
    prefs = await SharedPreferences.getInstance();
  }

}