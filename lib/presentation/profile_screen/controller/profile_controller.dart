import 'package:college/repositiory/api/profile_screen/model/profile_model.dart';
import 'package:college/repositiory/api/profile_screen/services/profile_services.dart';

import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  bool isprofileLoading = true;

  Profile? profileDataRes;

  Future getProfileScreen() async {
    isprofileLoading = true;
    notifyListeners();
    final fetchedData = await ProfileServices().getProfileScreen();
    if (fetchedData.error != true) {
      ProfileResModel profileModel = fetchedData.data;
      profileDataRes = profileModel.profileData;
      print("## profileData ################$profileDataRes");
    }

    isprofileLoading = false;
    notifyListeners();

    print(profileDataRes);

    return profileDataRes;
  }
}
