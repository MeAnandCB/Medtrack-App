import 'package:college/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:college/presentation/hospital_list_screen/view/hospital_list_screen.dart';
import 'package:college/presentation/login_screen/view/login_screen.dart';
import 'package:college/presentation/register_screen/register_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:college/utils/app_utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkRegistrationStatus();
  }

  void checkRegistrationStatus() async {
    print("hello");

    AppUtils.getAccessKey().then((value) async {
      print("hello1");
      print("$value token");
      if (value != null && value.isNotEmpty) {
        print(value);
        print("hello2");
        Future.delayed(Duration(seconds: 3)).then((value) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ),
            (route) => false,
          );
        });
      } else {
        // User is not registered, navigate to registration screen after 3 seconds
        Future.delayed(Duration(seconds: 3)).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              child: Image.asset("assets/images/medical doc.png"),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
