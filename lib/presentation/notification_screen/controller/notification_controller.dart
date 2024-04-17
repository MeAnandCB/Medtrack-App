import 'package:college/repositiory/api/alert_screen/model/alert_model.dart';
import 'package:college/repositiory/api/alert_screen/services/services.dart';
import 'package:flutter/material.dart';

class AlertController extends ChangeNotifier {
  bool isAlertListLoading = true;

  List<ResAlert>? alertList = [];

  Future geAlertList() async {
    isAlertListLoading = true;
    notifyListeners();
    final fetchedData = await AlertServices().getAlertcreen();
    if (fetchedData.error != true) {
      AlertResModel alertListModel = fetchedData.data;
      alertList = alertListModel.data ?? [];
      print("##Alert list ################$alertList");
    }

    isAlertListLoading = false;
    notifyListeners();

    print(alertList);

    return alertList;
  }
}
