import 'package:college/repositiory/api/registration_screen/services/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreenController extends ChangeNotifier {
  bool isPostLoading = false;
  late SharedPreferences sharedPreferences;
  Future<bool> onRegister(
      {required String full_name,
      required String phone,
      required String email,
      required String dob,
      required String gender,
      required String user,
      required String pass}) async {
    print(
        "############################# $full_name $phone $email $dob $gender $user $pass");

    sharedPreferences = await SharedPreferences.getInstance();
    isPostLoading = true;
    notifyListeners();
    try {
      // need to update values from  user input
      final fetchedData =
          await RegistrationScreenServides().onRegistration(body: {
        "user": {"username": user, "email": email, "password": pass},
        "name": full_name,
        "dob": dob,
        "gender": gender,
        "phone_number": phone
      });
      if (fetchedData.error != true) {
        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }
}
