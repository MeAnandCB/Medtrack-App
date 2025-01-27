//function to get course detils

import 'package:college/repositiory/api/doctor_details_screen/model/book_appinment_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/model/doctors_details_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/model/time_slot_model.dart';

import 'package:college/repositiory/helper/api_helper.dart';
import 'package:college/repositiory/helper/api_response.dart';
import 'package:college/utils/app_utils.dart';

// get DoctorDetailsScreenServices
class DoctorDetailsScreenServices {
  Future<APIResponse> getDoctoDetailstScreen({required String doctorID}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/doctor-detal/$doctorID/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      print("/doctors-list-by-department/$doctorID/");
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        DoctorDetailstResModel resData =
            DoctorDetailstResModel.fromJson(response.data);

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }
  // get the time slot here

  Future<APIResponse> getTimeSloatScreen(
      {required String date, required String doctorID}) async {
    try {
      final APIResponse response = await ApiHelper.getData(
          endPoint: "/available-slots/$doctorID/$date/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      print("/available-slots/$doctorID/$date/");
      if (response.error) {
        print("***************************************ERRORdone");
        return response;
      } else {
        TimeSlotResModel resData = TimeSlotResModel.fromJson(response.data);

        print("***************************************$resData");
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      rethrow;
    }
  }

  // post the appoinment
  Future<APIResponse> onPostAppoinment(
      {required Map<String, dynamic> body, required String doctorID}) async {
    try {
      final APIResponse response = await ApiHelper.postData(
          body: body,
          endPoint: "/book-appointment/$doctorID/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      if (response.error) {
        print("hello login response");
        return response;
      } else {
        print("hello login response success");
        BookAppoinmentResModel redData =
            BookAppoinmentResModel.fromJson(response.data);
        return APIResponse(data: redData, error: false, errorMessage: '');
      }
    } catch (e) {
      return APIResponse(
          data: 'res data', error: true, errorMessage: 'failed to fetch data');
    }
  }
}
