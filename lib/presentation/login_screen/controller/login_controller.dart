import 'dart:convert';
import 'package:college/app_config/app_config.dart';
import 'package:college/repositiory/api/login_screen/models/login_res_model.dart';
import 'package:college/repositiory/api/login_screen/service/login_screen_service.dart';
import 'package:college/utils/app_utils.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends ChangeNotifier {
  bool isLoading = false;
  late SharedPreferences sharedPreferences;
  LoginResModel? loginData;
  String? userPassword;

  // to Fetch the Course demo videos

  Future<bool> onLogin(
      {required String phone, required String password}) async {
    sharedPreferences = await SharedPreferences.getInstance();
    isLoading = true;
    notifyListeners();

    try {
      // need to update values from  user input
      final fetchedData = await LoginScreenServides().onLogin(body: {
        "email": phone,
        "password": password,
      });

      if (fetchedData.error != true) {
        print("login success");
        loginData = fetchedData.data;

        if (loginData != null) {
          Map<String, dynamic> sharedData = {
            'access': loginData!.data!.access,
            "refreshAccess": loginData!.data!.refresh,
            "refresh": loginData!.data!.refresh,
            "user": loginData!.data!.username
          };

          ///setting shared pref
          ///this is where first time the data is stored to sharedpref as map converted json.
          await sharedPreferences.setString(
              AppConfig.LOGIN_DATA, jsonEncode(sharedData));

          print("*************${await AppUtils.getAccessKey()}");
        }

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        print("login faliled");
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      return false;
    }
  }
}
