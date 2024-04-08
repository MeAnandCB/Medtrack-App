//function to get course detils

import 'package:college/repositiory/api/hospital_list_screen/model/hospital_list_model.dart';
import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class HospitalScreenServices {
  Future<APIResponse> getHospitalLIstScreen() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/hospital-list/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        print("hello");
        HospitalListResModel resData =
            HospitalListResModel.fromJson(response.data);
        print("hell2o");

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }
}
