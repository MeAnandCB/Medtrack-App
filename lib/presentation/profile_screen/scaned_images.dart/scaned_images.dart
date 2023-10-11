import 'package:college/presentation/profile_screen/image_upload_screen/image_upload_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class MedicalReports extends StatelessWidget {
  const MedicalReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        centerTitle: true,
        title: Text("Reports"),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageGallery(),
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
                      Icons.photo_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Images",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                color: ColorCOnstant.myContainerGrey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
