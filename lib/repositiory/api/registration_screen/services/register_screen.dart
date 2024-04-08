import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';

class RegistrationScreenServides {
  Future<APIResponse> onRegistration(
      {required Map<String, dynamic> body}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/patient-register/",
          header: ApiHelper.getApiHeader());
      if (response.error) {
        return response;
      } else {
        return APIResponse(data: "redData", error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
