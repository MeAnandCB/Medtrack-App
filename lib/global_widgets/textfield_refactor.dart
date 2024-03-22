import 'package:flutter/material.dart';

import '../utils/color_constants/color_constant.dart';

class TextFieldRefactor extends StatelessWidget {
  final String name;
  TextEditingController? namecontroller;
  TextFieldRefactor({super.key, required this.name, this.namecontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: namecontroller,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorCOnstant.myRoseColor),
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorCOnstant.myRoseColor),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: name,
              labelText: name,
            ),
          ),
        ],
      ),
    );
  }
}
