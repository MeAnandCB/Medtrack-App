//function to get course detils

import 'package:college/repositiory/api/deaprtment_screen/model/department_model.dart';
import 'package:college/repositiory/api/hospital_list_screen/model/hospital_list_model.dart';
import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class DepartmentScreenServices {
  Future<APIResponse> getDepartmentLIstScreen({required String id}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/department-list-by-hospital/$id/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print(
            "*****************Department data **********************ERRORdone");
        return response;
      } else {
        print("hello");
        DepartmentListResModel resData =
            DepartmentListResModel.fromJson(response.data);
        print("hell2o");

        print("***************Department data************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }
}
