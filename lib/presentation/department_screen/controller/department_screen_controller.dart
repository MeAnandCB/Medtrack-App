import 'package:college/repositiory/api/deaprtment_screen/model/department_model.dart';
import 'package:college/repositiory/api/deaprtment_screen/services/department_services.dart';

import 'package:flutter/material.dart';

class DepartmentListController extends ChangeNotifier {
  bool isDepartmentLoading = true;

  List<Department> departmentList = [];

  Future<List<Department>> getDepartmentList({required String id}) async {
    isDepartmentLoading = true;
    notifyListeners();
    final fetchedData =
        await DepartmentScreenServices().getDepartmentLIstScreen(id: id);
    if (fetchedData.error != true) {
      DepartmentListResModel departmentListModel = fetchedData.data;
      departmentList = departmentListModel.departmentData ?? [];
      print("##Departmrnt list ################$departmentList");
    }

    isDepartmentLoading = false;
    notifyListeners();

    print(departmentList);

    return departmentList;
  }
}
