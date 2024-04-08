import 'package:college/app_config/app_config.dart';
import 'package:college/presentation/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:college/presentation/doctors_list/controller/doctors_list_controller.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsListScreen extends StatefulWidget {
  const DoctorsListScreen({super.key, required this.doctorID});

  final String doctorID;

  @override
  State<DoctorsListScreen> createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DoctorsListController>(context, listen: false)
          .getDoctorsList(doctorID: widget.doctorID);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final doctorslistProvider = Provider.of<DoctorsListController>(context);
    return Scaffold(
        backgroundColor: ColorCOnstant.myContainerGrey,
        appBar: AppBar(
            backgroundColor: ColorCOnstant.myBlueColor,
            title: Text(
              "",
              style: TextStyle(color: Colors.white),
            )),
        body: doctorslistProvider.isDoctorsListLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: doctorslistProvider.doctorsList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoctorDetailsScreen(id: 11, indexNum: index),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorCOnstant.myWhite,
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(AppConfig.mediaUrl +
                                            (doctorslistProvider
                                                    .doctorsList[index].image ??
                                                "")),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                      doctorslistProvider
                                              .doctorsList[index].name ??
                                          "",
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: ColorCOnstant.myText),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      doctorslistProvider
                                              .doctorsList[index].degree ??
                                          "",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorCOnstant.myLiteBlue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      doctorslistProvider.doctorsList[index]
                                              .specialization ??
                                          "",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorCOnstant.myLiteBlue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Icon(
                                      //   Icons.group_rounded,
                                      //   color: ColorCOnstant.myLiteBlue,
                                      // ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      // Text(
                                      //   doctorslistProvider
                                      //       .doctorsList[index]
                                      //       .toString(),
                                      //   style: TextStyle(
                                      //     fontSize: 14,
                                      //     color: ColorCOnstant.myText,
                                      //   ),
                                      // ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      // Icon(
                                      //   Icons.star,
                                      //   size: 15,
                                      //   color: Colors.amber,
                                      // ),
                                      // SizedBox(
                                      //   width: 5,
                                      // ),
                                      // Text(
                                      //   doctorslistProvider.doctorsList[index].
                                      //       .toString(),
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(),
                              //===============================================================================
                              SizedBox(),
                              //===============================================================================
                              SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Years Of Experience :  ${doctorslistProvider.doctorsList[index].experience ?? ""}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorCOnstant.myLiteBlue,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorCOnstant.myBlueColor,
                                ),
                                child: Text("Book Now",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorCOnstant.myWhite,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
              ));
  }
}
