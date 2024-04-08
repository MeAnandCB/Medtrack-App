import 'package:college/repositiory/api/doctors_list_screen/model/doctors_list_screen_model.dart';
import 'package:college/repositiory/api/doctors_list_screen/services/doctors_list_screen.services.dart';

import 'package:flutter/material.dart';

class DoctorsListController extends ChangeNotifier {
  bool isDoctorsListLoading = true;

  List<DoctorsList> doctorsList = [];

  Future<List<DoctorsList>> getDoctorsList({required String doctorID}) async {
    isDoctorsListLoading = true;
    notifyListeners();
    final fetchedData = await DoctorsListScreenServices()
        .getDoctorLIstScreen(doctorID: doctorID);
    if (fetchedData.error != true) {
      DoctorsListResModel doctorsListModel = fetchedData.data;
      doctorsList = doctorsListModel.doctorsListRes ?? [];
      print("##doctors list ################$doctorsList");
    }

    isDoctorsListLoading = false;
    notifyListeners();

    print(doctorsList);

    return doctorsList;
  }
}
