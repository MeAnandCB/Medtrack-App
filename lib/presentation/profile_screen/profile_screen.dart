import 'package:college/presentation/profile_screen/image_upload_screen/image_upload_screen.dart';
import 'package:college/presentation/profile_screen/scaned_images.dart/scaned_images.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        title: Text("Profile Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicalReports(),
                    ));
              },
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_present_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Medical Reports",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  color: ColorCOnstant.myContainerGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
