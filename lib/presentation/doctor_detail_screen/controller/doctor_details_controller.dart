import 'package:college/repositiory/api/doctor_details_screen/model/doctors_details_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/model/time_slot_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/services/doctors_details_services.dart';

import 'package:flutter/material.dart';

class DoctorDetailsController extends ChangeNotifier {
  bool isDoctorDetailsLoading = true;

  Details? doctorDetails;
  List<TimeSlot>? timeSlotData;
//get doters details screen
  Future getDoctordetailsList({required String id}) async {
    isDoctorDetailsLoading = true;
    notifyListeners();
    final fetchedData = await DoctorDetailsScreenServices()
        .getDoctoDetailstScreen(doctorID: id);
    if (fetchedData.error != true) {
      DoctorDetailstResModel departmentListModel = fetchedData.data;
      doctorDetails = departmentListModel.doctorDetail;
    }

    isDoctorDetailsLoading = false;
    notifyListeners();

    print(doctorDetails);

    return doctorDetails;
  }

// get time slot
  Future getTimeSlotList(
      {required String date, required String doctorID}) async {
    isDoctorDetailsLoading = true;
    notifyListeners();
    final fetchedData = await DoctorDetailsScreenServices()
        .getTimeSloatScreen(date: date, doctorID: doctorID);
    if (fetchedData.error != true) {
      TimeSlotResModel timeslotModel = fetchedData.data;
      timeSlotData = timeslotModel.timeSlotData ?? [];
    }

    isDoctorDetailsLoading = false;
    notifyListeners();

    print(timeSlotData);

    return timeSlotData;
  }

  //book data
  bool isPostLoading = false;

  Future<bool> onBookAppoinment({
    required String date,
    required String time,
    required String id,
  }) async {
    isPostLoading = true;
    notifyListeners();
    try {
      // need to update values from  user input
      final fetchedData = await DoctorDetailsScreenServices()
          .onPostAppoinment(body: {"day": date, "time": time}, doctorID: id);
      if (fetchedData.error != true) {
        isPostLoading = false;
        notifyListeners();
        return true;
      } else {
        isPostLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      isPostLoading = false;
      notifyListeners();
      return false;
    }
  }
}
