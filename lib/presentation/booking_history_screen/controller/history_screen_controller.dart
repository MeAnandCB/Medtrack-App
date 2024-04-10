import 'package:college/repositiory/api/booking_history_screen/model/history_model.dart';
import 'package:college/repositiory/api/booking_history_screen/services/booking_history_services.dart';

import 'package:flutter/material.dart';

class BookingHistoryController extends ChangeNotifier {
  bool isDepartmentLoading = true;
  bool removeLoading = false;

  List<History>? historyRes = [];

  Future<List<History>?> getHistoryList() async {
    isDepartmentLoading = true;
    notifyListeners();
    final fetchedData = await HistoryScreenServices().getHistoryScreen();
    if (fetchedData.error != true) {
      BookingHistoryResModel historyListModel = fetchedData.data;
      historyRes = historyListModel.historyRes ?? [];
      print("##Departmrnt list ################$historyRes");
    }

    isDepartmentLoading = false;
    notifyListeners();

    print(historyRes);

    return historyRes;
  }

  //cancel appoinment

  Future cancelAppointment({required String id}) async {
    removeLoading = true;
    notifyListeners();

    try {
      final deleteData =
          await HistoryScreenServices().cancelAppointment(id: id);
      if (deleteData.error != true) {
        print(deleteData.error);
        await getHistoryList();
        notifyListeners();
      }
      removeLoading = false;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
