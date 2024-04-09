//function to get course detils

import 'package:college/repositiory/api/profile_screen/model/profile_model.dart';
import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class ProfileServices {
  Future<APIResponse> getProfileScreen() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/user-profile/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERRORdone");
        print(response.errorMessage);

        return response;
      } else {
        ProfileResModel resData = ProfileResModel.fromJson(response.data);

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      print("***************************************Exec");
      print(e);
      rethrow;
    }
  }
}
