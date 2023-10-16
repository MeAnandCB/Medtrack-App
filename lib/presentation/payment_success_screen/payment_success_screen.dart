import 'package:college/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: ColorCOnstant.myRoseColor,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  Container(
                    child: Center(
                        child: Lottie.asset(
                            "assets/animations/payment_success.json")),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ColorCOnstant.myRoseColor)),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomNavScreen(),
                          ),
                          (route) => false);
                    },
                    child: Text(
                      " << Back to home",
                      style: TextStyle(color: ColorCOnstant.myWhite),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
