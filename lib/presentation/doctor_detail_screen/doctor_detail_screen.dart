import 'dart:math';

import 'package:college/app_config/app_config.dart';
import 'package:college/box/box.dart';
import 'package:college/database/data_base_with_model.dart';
import 'package:college/model/history_model.dart';
import 'package:college/presentation/doctor_detail_screen/controller/doctor_details_controller.dart';
import 'package:college/presentation/doctors_list/controller/doctors_list_controller.dart';

import 'package:college/presentation/payment_success_screen/payment_success_screen.dart';
import 'package:college/repositiory/api/doctor_details_screen/model/time_slot_model.dart';

import 'package:college/utils/color_constants/color_constant.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen(
      {super.key, required this.id, required this.indexNum});
  final String id;
  final int indexNum;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DoctorDetailsController>(context, listen: false)
          .getDoctordetailsList(id: widget.id);
    });

    super.initState();
  }

  String? startedTime = '';
  int? selectedIndex;
  bool timeIndex = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate)
      setState(() {
        selectedDate = pickedDate;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (pickedTime != null && pickedTime != selectedTime)
      setState(() {
        selectedTime = pickedTime;
      });
  }

  @override
  Widget build(BuildContext context) {
    final doctorDetailsProvider = Provider.of<DoctorDetailsController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myBlueColor,
      ),
      body: doctorDetailsProvider.isDoctorDetailsLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(AppConfig.mediaUrl +
                                  (doctorDetailsProvider.doctorDetails?.image ??
                                      "")),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorDetailsProvider.doctorDetails?.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Text(
                          doctorDetailsProvider.doctorDetails?.degree ?? "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.5),
                        ),
                        Text(
                          doctorDetailsProvider.doctorDetails?.specialization ??
                              "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorCOnstant.myBlueColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total years of experiance   : ",
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                doctorDetailsProvider.doctorDetails?.experience
                                        .toString() ??
                                    "",
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          doctorDetailsProvider.doctorDetails?.description ??
                              "",
                          textAlign: TextAlign.justify,
                          style: TextStyle(height: 1.5),
                        ),
                        SizedBox(
                          height: 25,
                        ),

                        // here is the code for confirming the date -----------------------------------------------------------------------------
                        // EasyDateTimeLine(
                        //   activeColor: ColorCOnstant.myRoseColor,
                        //   initialDate: DateTime.now(),
                        //   onDateChange: (selectedDate) {
                        //     setState(() {
                        //       dateSeleted = selectedDate;
                        //     });
                        //   },
                        // ),
                        Text(
                          "Select your Date",
                          style: TextStyle(
                              color: ColorCOnstant.myText,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: ColorCOnstant.myBlueColor)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ' ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              IconButton(
                                  onPressed: () => _selectDate(context),
                                  icon: Icon(Icons.calendar_month_rounded))
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (selectedDate.day != null) {
                                  timeIndex = true;
                                  await Provider.of<DoctorDetailsController>(
                                          context,
                                          listen: false)
                                      .getTimeSlotList(
                                          date:
                                              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                                          doctorID: doctorDetailsProvider
                                                  .doctorDetails?.id
                                                  .toString() ??
                                              "");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorCOnstant.myLiteBlue,
                                ),
                                child: Text(
                                  "Select your time slot",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        timeIndex == true
                            ? Text(
                                "Time slot",
                                style: TextStyle(
                                    color: ColorCOnstant.myText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            : SizedBox(),

                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              height: 15,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Available")
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              height: 15,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Booked")
                                ],
                              ),
                            )),
                            Expanded(
                                child: Container(
                              height: 15,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 5,
                                    backgroundColor: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Selected")
                                ],
                              ),
                            ))
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        timeIndex == true
                            ? GridView.builder(
                                itemCount:
                                    doctorDetailsProvider.timeSlotData?.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 60,
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10),
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                    print(doctorDetailsProvider
                                        .timeSlotData?[index].isBooked);

                                    // Check if the slot is booked
                                    if (doctorDetailsProvider
                                            .timeSlotData?[index]?.isBooked ==
                                        true) {
                                      print("This slot is already booked!");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              'This slot is already booked!'),
                                        ),
                                      );
                                    } else {
                                      print("Slot selected!");
                                    }
                                    ;
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: (doctorDetailsProvider
                                                  .timeSlotData?[index]
                                                  ?.isBooked ??
                                              false)
                                          ? Colors.red.shade300
                                          : (selectedIndex == index
                                              ? Colors.amber
                                              : Colors.green),
                                    ),
                                    child: Center(
                                      child: Text(
                                        doctorDetailsProvider
                                                .timeSlotData?[index]?.time ??
                                            "",
                                        style: TextStyle(
                                          color: ColorCOnstant.myWhite,
                                        ),
                                      ),
                                    ),
                                    // Disable selection if the slot is booked
                                  ),
                                ),
                              )
                            : SizedBox(),

                        SizedBox(height: 20),

                        // selct the time for booking -----------------------------------------------------------------------------

                        // book button to Confirming the null from the date and time-----------------------------------------------------------------------------
                        timeIndex == true
                            ? InkWell(
                                onTap: () {
                                  // bookingConfirmationSheet(
                                  //     context: context,
                                  //     name: "",
                                  //     qualif: "",
                                  //     desi: "",
                                  //     date: "date",
                                  //     time: "time",
                                  //     fee: "fee");

                                  if (doctorDetailsProvider
                                          .timeSlotData?[selectedIndex!]
                                          ?.isBooked ==
                                      true) {
                                    print("This slot is already booked!");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                            'This slot is already booked! Please select another slot'),
                                      ),
                                    );
                                  } else {
                                    bookingConfirmationSheet(
                                      context: context,
                                      name: doctorDetailsProvider
                                              .doctorDetails?.name ??
                                          "",
                                      qualif: doctorDetailsProvider
                                              .doctorDetails?.degree ??
                                          "",
                                      desi: doctorDetailsProvider
                                              .doctorDetails?.specialization ??
                                          "",
                                      date:
                                          '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                                      time: doctorDetailsProvider
                                              .timeSlotData?[selectedIndex!]
                                              .time ??
                                          "",
                                      fee: "200" ?? "",
                                    );
                                  }
                                  ;
                                },
                                child: Container(
                                  height: 60,
                                  width: double.infinity,
                                  color: ColorCOnstant.myBlueColor,
                                  child: Center(
                                    child: Text(
                                      "BOOK NOW",
                                      style: TextStyle(
                                          color: ColorCOnstant.myWhite,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> bookingConfirmationSheet({
    required BuildContext context,
    required String name,
    required String qualif,
    required String desi,
    required String date,
    required String time,
    required String fee,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  qualif,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  desi,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Your Booking time and Date",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Time: $time",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Date: $date ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Please confirm your doctor's if the information provided above is accurate and suitable for you.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: Text(
                    "Consultation fee: $fee",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 3)).then((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentSuccessScreen(),
                        ),
                      );
                    });
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 50),
                              Text(
                                "Scan and Pay",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  "assets/images/doctors/general_medicine/qr.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    Future.delayed(Duration(seconds: 3)).then((_) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentSuccessScreen(),
                        ),
                      );
                    });
                  },
                  child: Text("Proceed", style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // String formatter(String datetime) {
  //   String originalString = datetime;
  //   String resultString = originalString.substring(0, 10);
  //   return resultString.toString();
  // }

  int generateRandomNumber() {
    int min = 0;
    int max = 100;
    final Random random = Random();
    return min + random.nextInt(max - min + 1);
  }
}
