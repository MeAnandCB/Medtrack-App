import 'package:college/repositiory/api/doctor_details_screen/model/doctors_details_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/model/time_slot_model.dart';
import 'package:college/repositiory/api/doctor_details_screen/services/doctors_details_services.dart';

import 'package:flutter/material.dart';

class DoctorDetailsController extends ChangeNotifier {
  bool isDoctorDetailsLoading = true;
  bool istimeLoading = true;

  Details? doctorDetails;
  List<TimeSlot>? timeSlotData;

//date
  String? startedTime = '';
  int? selectedIndex;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      selectedDate = pickedDate;
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (pickedTime != null && pickedTime != selectedTime)
      selectedTime = pickedTime;
    notifyListeners();
  }

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
    istimeLoading = true;
    notifyListeners();
    final fetchedData = await DoctorDetailsScreenServices()
        .getTimeSloatScreen(date: date, doctorID: doctorID);
    if (fetchedData.error != true) {
      TimeSlotResModel timeslotModel = fetchedData.data;
      timeSlotData = timeslotModel.timeSlotData ?? [];
    }

    istimeLoading = false;
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
