import 'package:shared_preferences/shared_preferences.dart';

class Darkmode {
  static const String darkmode = "Toggle dark";
  bool darIsOn = false;

  void setDarkmode() async {
    var sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setBool(darkmode, true);
  }
}
