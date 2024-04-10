import 'package:college/utils/color_constants/color_constant.dart';

import 'package:flutter/material.dart';

class CustomAlertPopup extends StatelessWidget {
  const CustomAlertPopup({
    super.key,
    required this.onyesPressed,
    required this.title,
  });
  final VoidCallback onyesPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: CircleAvatar(
          radius: 25,
          backgroundColor: ColorCOnstant.myBlueColor,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.question_mark,
              color: ColorCOnstant.myBlueColor,
            ),
          ),
        ),
        content: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Text(
            // this is the one that actually works
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 30,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    // mark 2 yes button - for saving the json string to database
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: ColorCOnstant.myBlueColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: TextStyle(
                            fontSize: 20,
                            color: ColorCOnstant.myBlueColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    onyesPressed();
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCOnstant.myBlueColor,
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
