import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/textfield_refactor.dart';
import '../../utils/color_constants/color_constant.dart';
import '../login_screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userController = TextEditingController();
  final userkey = GlobalKey<FormState>();
  String? name;
  @override
  void dispose() {
    super.dispose();
    userController.dispose();
  }

  saveData() {
    SharedPreferencesClass().saveString(userController.text);
    userController.clear();
    getData();
    setState(() {});
  }

  getData() {
    if (SharedPreferencesClass().getString() != null) {
      name = SharedPreferencesClass().getString();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/login.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Create New Account",
                style:
                    TextStyle(fontSize: 20, color: ColorCOnstant.myRoseColor),
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldRefactor(name: "Full Name"),
              TextFieldRefactor(name: "Mobile Number"),
              TextFieldRefactor(name: "DOB (DD-MM-YYYY)"),
              TextFieldRefactor(name: "Gender  M/F/T"),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 20, color: ColorCOnstant.myRoseColor),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "User name",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: userkey,
                      child: TextFormField(
                        controller: userController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorCOnstant.myRoseColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: ColorCOnstant.myRoseColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "User name",
                          labelText: "User name",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Password",
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
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorCOnstant.myRoseColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorCOnstant.myRoseColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Password",
                        labelText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                          color: ColorCOnstant.myTextGrey,
                          fontSize: 14,
                          height: 1.5),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Log In",
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            if (userkey.currentState!.validate()) {
              saveData();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: ColorCOnstant.myRoseColor,
            ),
            height: 50,
            child: Center(
                child: Text(
              "Register",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
