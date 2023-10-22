import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesClass {
  static late final SharedPreferences pref;

  Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }

  saveUser(String name) {
    pref.setString("user", name);
  }

  savePass(String pass) {
    pref.setString("pass", pass);
  }

  getUserString() {
    var name = pref.getString("user");
    return name;
  }

  getPassString() {
    var pass = pref.getString("pass");
    return pass;
  }

  deleteData({bool clearUser = false, bool clearPass = false}) {
    if (clearUser) {
      pref.remove("user");
    }
    if (clearPass) {
      pref.remove("pass");
    }
  }
}
