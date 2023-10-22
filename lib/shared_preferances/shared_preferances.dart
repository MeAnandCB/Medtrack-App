import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  static late final SharedPreferences pref;

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  saveString(String name) {
    pref.setString("user", name);
  }

  getString() {
    var name = pref.getString("user");
    return name;
  }

  deleteData() {
    pref.clear();
  }
}
