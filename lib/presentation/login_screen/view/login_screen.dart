import 'package:college/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:college/presentation/login_screen/controller/login_controller.dart';
import 'package:college/presentation/register_screen/register_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/app_utils.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferencesClass obj = SharedPreferencesClass();
  final usercontroller = TextEditingController();
  final passController = TextEditingController();
  final userkey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginScreenController>(context, listen: false);
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
                            color: ColorCOnstant.myBlueColor, fontSize: 30),
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
                            suffixIcon: Icon(Icons.person),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
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
                          obscureText: provider.viewPass == true ? false : true,
                          controller: passController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.viewPass = !provider.viewPass;
                                  print(provider.viewPass);
                                  setState(() {});
                                },
                                icon: provider.viewPass == false
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.visibility_off)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorCOnstant.myBlueColor),
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
                  onTap: () async {
                    if (usercontroller.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      await Provider.of<LoginScreenController>(context,
                              listen: false)
                          .onLogin(
                              phone: usercontroller.text.trim(),
                              password: passController.text.trim())
                          .then((value) async {
                        print("login value $value");
                        if (value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavScreen(),
                              ),
                              (route) => false);
                        } else {
                          AppUtils.oneTimeSnackBar(
                              bgColor: Colors.red,
                              "Enter a vaild user and pass",
                              context: context);
                        }
                        usercontroller.clear();
                        passController.clear();
                      });
                    } else {
                      AppUtils.oneTimeSnackBar(
                          bgColor: Colors.red,
                          "Enter valid user name or password",
                          context: context);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCOnstant.myBlueColor,
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
                        "Register Now",
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
