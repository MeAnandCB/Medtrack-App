import 'package:college/utils/color_constants/color_constant.dart';

import 'package:flutter/material.dart';

Future<bool> logoutConfirmPopup(
    {required BuildContext context,
    required VoidCallback yes,
    required String message}) async {
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
              backgroundColor: ColorCOnstant.myBlueColor,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.logout,
                  size: 25,
                  color: ColorCOnstant.myBlueColor,
                ),
              ),
            ),
            content: Text(
              // this is the one that actually works
              message,
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
                          border: Border.all(color: ColorCOnstant.myBlueColor),
                        ),
                        child: Center(
                          child: Text(
                            "No",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ColorCOnstant.myBlueColor),
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
                      onTap: yes,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorCOnstant.myBlueColor),
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
