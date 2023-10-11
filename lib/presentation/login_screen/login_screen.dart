import 'package:college/global_widgets/textfield_refactor.dart';
import 'package:college/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:college/presentation/register_screen/register_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myWhite,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          Column(
            children: [
              TextFieldRefactor(name: "username"),
              TextFieldRefactor(name: "Password"),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavScreen(),
                      ));
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
    );
  }
}
