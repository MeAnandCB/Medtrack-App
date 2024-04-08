import 'package:college/repositiory/api/hospital_list_screen/model/hospital_list_model.dart';
import 'package:college/repositiory/api/hospital_list_screen/services/hospital_list_services.dart';
import 'package:flutter/material.dart';

class HospitalListController extends ChangeNotifier {
  bool isHospitalLoading = true;

  List<HospitalListData> hospitalList = [];

  Future<List<HospitalListData>> getHospitalList() async {
    isHospitalLoading = true;
    notifyListeners();
    final fetchedData = await HospitalScreenServices().getHospitalLIstScreen();
    if (fetchedData.error != true) {
      HospitalListResModel hospitalListModel = fetchedData.data;
      hospitalList = hospitalListModel.hospitalListData ?? [];
      print("###################################$hospitalList");
    }

    isHospitalLoading = false;
    notifyListeners();

    print(hospitalList);

    return hospitalList;
  }
}
