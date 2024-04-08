//function to get course detils

import 'package:college/repositiory/api/doctors_list_screen/model/doctors_list_screen_model.dart';

import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class DoctorsListScreenServices {
  Future<APIResponse> getDoctorLIstScreen({required String doctorID}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/doctors-list-by-department/$doctorID/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      print("/doctors-list-by-department/$doctorID/");
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        DoctorsListResModel resData =
            DoctorsListResModel.fromJson(response.data);

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }
}
