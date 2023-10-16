import 'package:college/database/data_base_with_model.dart';
import 'package:college/presentation/booking_confirmation.dart/booking_confirmation_screen.dart';
import 'package:college/presentation/payment_success_screen/payment_success_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen(
      {super.key, required this.id, required this.indexNum});
  final int id;
  final int indexNum;

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  String startedTimeRange = 'please select any time slot';
  String endedTimeRange = 'please select any time slot';
  DateTime? dateSeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ModelDB.departmentsData[widget.id]
                                  .doctors[widget.indexNum].image ??
                              "assets/images/doctors/drr.png",
                        ),
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
                    ModelDB.departmentsData[widget.id].doctors[widget.indexNum]
                            .name ??
                        "",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    ModelDB.departmentsData[widget.id].doctors[widget.indexNum]
                            .qualification ??
                        "",
                    textAlign: TextAlign.justify,
                    style: TextStyle(height: 1.5),
                  ),
                  Text(
                    ModelDB.departmentsData[widget.id].doctors[widget.indexNum]
                            .designation ??
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
                      border: Border.all(color: ColorCOnstant.myRoseColor),
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
                          ModelDB.departmentsData[widget.id]
                              .doctors[widget.indexNum].yearsOfExperience
                              .toString(),
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
                    "${ModelDB.departmentsData[widget.id].department} deals with the diagnosis and nonsurgical treatment of diseases. General Medicine is considered to be the foundation for several specialties, sub-specialties and super specialties. The department focuses on providing preventive, curative and rehabilitative measures.  Evidence-based protocols in patient care and teaching are in place",
                    textAlign: TextAlign.justify,
                    style: TextStyle(height: 1.5),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  // Container(
                  //     height: 100,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) => Container(
                  //         width: 60,
                  //         color: Colors.amber,
                  //       ),
                  //     )),
                  EasyDateTimeLine(
                    activeColor: ColorCOnstant.myRoseColor,
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      setState(() {
                        dateSeleted = selectedDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Select your time slot",
                    style: TextStyle(
                        color: ColorCOnstant.myText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TimeRange(
                    borderColor: ColorCOnstant.myRoseColor,
                    fromTitle: Text(
                      'From',
                      style: TextStyle(
                          fontSize: 18, color: ColorCOnstant.myRoseColor),
                    ),
                    toTitle: Text(
                      'To',
                      style: TextStyle(
                          fontSize: 18, color: ColorCOnstant.myRoseColor),
                    ),
                    titlePadding: 20,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.normal, color: Colors.black87),
                    activeTextStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    backgroundColor: Colors.transparent,
                    firstTime: TimeOfDay(hour: 14, minute: 30),
                    lastTime: TimeOfDay(hour: 20, minute: 00),
                    activeBackgroundColor: ColorCOnstant.myRoseColor,
                    activeBorderColor: ColorCOnstant.myRoseColor,
                    timeStep: 10,
                    timeBlock: 30,
                    onRangeCompleted: (range) {
                      setState(() {
                        startedTimeRange = range!.start.format(context);
                        endedTimeRange = range.end.format(context);
                        print(startedTimeRange);
                      });
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),

                  InkWell(
                    onTap: () {
                      bookingConfirmationSheet(
                          context,
                          ModelDB.departmentsData[widget.id]
                                  .doctors[widget.indexNum].name ??
                              "",
                          ModelDB.departmentsData[widget.id]
                                  .doctors[widget.indexNum].qualification ??
                              "",
                          ModelDB.departmentsData[widget.id]
                                  .doctors[widget.indexNum].designation ??
                              "",
                          startedTimeRange,
                          endedTimeRange,
                          dateSeleted!);
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      color: ColorCOnstant.myRoseColor,
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
                  ),
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

  Future<dynamic> bookingConfirmationSheet(
      BuildContext context,
      String name,
      String qualif,
      String desi,
      String? startdate,
      String? endtdate,
      DateTime date) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                )),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: ColorCOnstant.myRoseColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  qualif,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  desi,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: ColorCOnstant.myContainerGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Your Booking time and Date \n ${startdate.toString()} to ${endtdate.toString()}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorCOnstant.myRoseColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Date :${formatter(dateSeleted.toString())}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Please confirm your doctor's\nif the information provided above is accurate and suitable for you.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(ColorCOnstant.myRoseColor)),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 3))
                        .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentSuccessScreen(),
                              ),
                            ));
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Text(
                                "Scan and Pay",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Center(
                                child:
                                    Image.asset("assets/images/doctors/qr.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    Future.delayed(Duration(seconds: 3))
                        .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentSuccessScreen(),
                              ),
                            ));
                  },
                  child: Text("Proceed "),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatter(String datetime) {
    String originalString = datetime;
    String resultString = originalString.substring(0, 10);
    return resultString.toString();
  }
}
