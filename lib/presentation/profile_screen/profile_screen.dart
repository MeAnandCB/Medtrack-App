import 'package:college/global_widgets/alert_popup.dart';
import 'package:college/global_widgets/confirmation_popup.dart';
import 'package:college/presentation/login_screen/view/login_screen.dart';
import 'package:college/presentation/profile_screen/controller/profile_controller.dart';
import 'package:college/presentation/profile_screen/scaned_images.dart/scaned_images.dart';
import 'package:college/repositiory/helper/helper_fincitons.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<ProfileController>(context, listen: false)
          .getProfileScreen();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileController>(context);
    print(provider.profileDataRes);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myBlueColor,
        title: Text(
          "Profile Screen",
          style: TextStyle(color: ColorCOnstant.myWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("Name")),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(provider.profileDataRes?.name ?? ""),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("Phone")),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(provider.profileDataRes?.phoneNumber ?? ""),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("Email")),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(provider.profileDataRes?.user?.email ?? ""),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: Text("DOB")),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("20-11-1995"),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
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
                  height: 60,
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
                height: 10,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    //the return value will be from "Yes" or "No" options
                    context: context,
                    builder: (context) => CustomAlertPopup(
                        title: 'Do you want to LogOut?',
                        onyesPressed: () {
                          HelperFunctions.logOut(context);
                        }),
                  );
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: ColorCOnstant.myContainerGrey,
                  ),
                  child: Center(
                    child: Text(
                      "Logout",
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
