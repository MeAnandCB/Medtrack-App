import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> databaseImagesDepartment = [
      "assets/images/doctors_department/brain.png",
      "assets/images/doctors_department/cancer.png",
      "assets/images/doctors_department/emergency.png",
      "assets/images/doctors_department/heart.png",
      "assets/images/doctors_department/pediatrics.png",
      "assets/images/doctors_department/skin.png",
      "assets/images/doctors_department/surgery.png",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        centerTitle: true,
        title: Text("Departments"),
      ),
      body: GridView.builder(
        itemCount: databaseImagesDepartment.length,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 200),
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCOnstant.myContainerGrey,
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(databaseImagesDepartment[index])),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Genaral Medicine")
          ],
        ),
      ),
    );
  }
}

class DatabaseImages {}
