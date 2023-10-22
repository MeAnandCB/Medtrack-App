import 'package:college/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:college/presentation/register_screen/register_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferencesClass obj = SharedPreferencesClass();
  final usercontroller = TextEditingController();
  final PassController = TextEditingController();
  final userkey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            color: ColorCOnstant.myRoseColor, fontSize: 30),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "We're excited to have you back, can't wait to to see what you've been up to since you last logged in",
                    style: TextStyle(
                        color: ColorCOnstant.myTextGrey,
                        fontSize: 14,
                        height: 1.5),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
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
                          controller: usercontroller,
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
                            if (value != obj.getUserString()) {
                              return 'Please enter vaild user name';
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
                      Form(
                        key: passKey,
                        child: TextFormField(
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
                          validator: (value) {
                            if (value != obj.getPassString()) {
                              return 'Please enter vaild password';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (userkey.currentState!.validate() &&
                        passKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavScreen(),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Successfull'),
                          backgroundColor: ColorCOnstant.myRoseColor,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Wrong Credentials')),
                      );
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCOnstant.myRoseColor,
                    ),
                    child: Center(
                      child: Text("Login",
                          style: TextStyle(
                              color: ColorCOnstant.myWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an Account?",
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
                              builder: (context) => RegisterScreen(),
                            ));
                      },
                      child: Text(
                        "Sign In",
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
