import 'package:college/presentation/login_screen/login_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

Future<bool> logoutConfirmPopup({required BuildContext context}) async {
  SharedPreferencesClass obj = SharedPreferencesClass();
  return await showDialog(
        //the return value will be from "Yes" or "No" options
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(25),
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: CircleAvatar(
              radius: 24,
              backgroundColor: ColorCOnstant.myRoseColor,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: ColorCOnstant.myRoseColor,
                ),
              ),
            ),
            content: Text(
              // this is the one that actually works
              "do you want to exit",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ColorCOnstant.myRoseColor),
                        ),
                        child: Center(
                          child: Text(
                            "No",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorCOnstant.myRoseColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        SharedPreferencesClass()
                            .deleteData(clearUser: true, clearPass: true);
                        await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false);

                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCOnstant.myRoseColor),
                        child: Center(
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}
