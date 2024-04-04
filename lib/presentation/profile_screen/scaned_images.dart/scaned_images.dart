import 'package:college/presentation/profile_screen/image_upload_screen/camera_image_save.dart';
import 'package:college/presentation/profile_screen/image_upload_screen/image_upload_screen.dart';

import 'package:college/utils/color_constants/color_constant.dart';

import 'package:flutter/material.dart';

class MedicalReports extends StatelessWidget {
  const MedicalReports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myBlueColor,
        centerTitle: true,
        title: Text("Reports"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageCamera(),
                    ));
              },
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Take a picture",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  color: ColorCOnstant.myContainerGrey,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.photo_sharp,
                          size: 30,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Gallery",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  color: ColorCOnstant.myContainerGrey,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => FileUploader(),
            //         ));
            //   },
            //   child: SizedBox(
            //     height: 100,
            //     width: double.infinity,
            //     child: Card(
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.start,
            //           children: [
            //             Icon(
            //               Icons.file_copy_sharp,
            //               size: 30,
            //             ),
            //             SizedBox(
            //               width: 30,
            //             ),
            //             Text(
            //               "Upload pdf",
            //               style: TextStyle(fontSize: 20),
            //             )
            //           ],
            //         ),
            //       ),
            //       color: ColorCOnstant.myContainerGrey,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
