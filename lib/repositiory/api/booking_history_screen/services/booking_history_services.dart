//function to get course detils

import 'package:college/repositiory/api/booking_history_screen/model/history_model.dart';
import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

class HistoryScreenServices {
  Future<APIResponse> getHistoryScreen() async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/list-patient-appointments/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print(
            "*****************Department data **********************ERRORdone");
        return response;
      } else {
        print("hello");
        BookingHistoryResModel resData =
            BookingHistoryResModel.fromJson(response.data);
        print("hell2o");

        print("***************Department data************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Cancel appoinment
  Future<APIResponse> cancelAppointment({required String id}) async {
    try {
      final APIResponse response = await ApiHelper.deleteData(
          body: {},
          endPoint: "/cancel-appointment/$id/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
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
