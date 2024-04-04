import 'package:college/database/data_base_with_model.dart';
import 'package:college/presentation/doctor_detail_screen/doctor_detail_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen(
      {super.key, required this.id, required this.categoryId});
  final int id;
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorCOnstant.myContainerGrey,
        appBar: AppBar(
            backgroundColor: ColorCOnstant.myBlueColor,
            title: id == categoryId + 1
                ? Text(
                    ModelDB.departmentsData[categoryId].department ?? "",
                    style: TextStyle(color: Colors.white),
                  )
                : Text("")),
        body: ListView.separated(
          itemCount: ModelDB.departmentsData[categoryId].doctors.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DoctorDetailsScreen(id: categoryId, indexNum: index),
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
                                  image: AssetImage(
                                    ModelDB.departmentsData[categoryId]
                                            .doctors[index].image ??
                                        "assets/images/doctors/drr.png",
                                  ),
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
                                ModelDB.departmentsData[categoryId]
                                        .doctors[index].name ??
                                    "",
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorCOnstant.myText),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "(${ModelDB.departmentsData[categoryId].doctors[index].qualification ?? ""})",
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorCOnstant.myLiteBlue,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              ModelDB.departmentsData[categoryId].doctors[index]
                                      .designation ??
                                  "",
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorCOnstant.myLiteBlue,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.group_rounded,
                                  color: ColorCOnstant.myLiteBlue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  ModelDB.departmentsData[categoryId]
                                      .doctors[index].visitedPatientCount
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorCOnstant.myText,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Colors.amber,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ModelDB.departmentsData[categoryId]
                                      .doctors[index].ratingOutOf5
                                      .toString(),
                                )
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
                          "Years Of Experience :  ${ModelDB.departmentsData[categoryId].doctors[index].yearsOfExperience ?? "".toString()}",
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
