import 'package:college/global_widgets/confirmation_popup.dart';
import 'package:college/presentation/login_screen/login_screen.dart';
import 'package:college/presentation/profile_details/profile_details.dart';
import 'package:college/presentation/profile_screen/scaned_images.dart/scaned_images.dart';
import 'package:college/presentation/splash_screen/splash_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myRoseColor,
        title: Text("Profile Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => ProfileDetails(),
              //         ));
              //   },
              //   child: SizedBox(
              //     height: 80,
              //     width: double.infinity,
              //     child: Card(
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Icon(
              //             Icons.person,
              //             size: 25,
              //           ),
              //           SizedBox(
              //             width: 30,
              //           ),
              //           Text(
              //             "Profie Details",
              //             style: TextStyle(fontSize: 15),
              //           )
              //         ],
              //       ),
              //       color: ColorCOnstant.myContainerGrey,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MedicalReports(),
                      ));
                },
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_present_outlined,
                          size: 25,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Medical Reports",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    color: ColorCOnstant.myContainerGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Share.share(
                      "assets/images/Current Essentials of Medicine(1)(1).pdf");
                },
                child: SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          size: 25,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Share your Details",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    color: ColorCOnstant.myContainerGrey,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                child: Image.asset("assets/images/frame.png"),
              ),
              SizedBox(
                height: 70,
              ),
              InkWell(
                onTap: () {
                  logoutConfirmPopup(context: context);
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorCOnstant.myRoseColor,
                  ),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorCOnstant.myWhite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
