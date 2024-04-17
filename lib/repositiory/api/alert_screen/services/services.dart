import 'package:college/repositiory/api/alert_screen/model/alert_model.dart';
import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class AlertServices {
  Future<APIResponse> getAlertcreen() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/alerts/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("***************************************ERRORdone");
        print(response.errorMessage);

        return response;
      } else {
        AlertResModel resData = AlertResModel.fromJson(response.data);

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
