import 'package:college/database/database_image.dart';
import 'package:college/presentation/doctors_list/doctors_list.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        centerTitle: true,
        title: Text("Departments"),
      ),
      body: GridView.builder(
        itemCount: DatabaseImages.databaseImagesDepartment.length,
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 20, mainAxisExtent: 180),
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DoctorsListScreen(
                  id: DatabaseImages.databaseImagesDepartment[index]['id'],
                  categoryId: index,
                ),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
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
                            Image.asset(
                              DatabaseImages.databaseImagesDepartment[index]
                                  ['image'],
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      DatabaseImages.databaseImagesDepartment[index]
                          ['department'],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
