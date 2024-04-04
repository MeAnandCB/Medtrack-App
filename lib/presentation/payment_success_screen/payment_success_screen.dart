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
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(),
                    Center(
                      child: CircularProgressIndicator(
                        color: ColorCOnstant.myBlueColor,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Please wait we are processing your payment...\ndo not close/ back ..",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  Text(
                    "Payment Successful",
                    style: TextStyle(
                        fontSize: 20, color: ColorCOnstant.myBlueColor),
                  ),
                  Container(
                    child: Center(
                        child: Lottie.asset(
                            "assets/animations/payment_success.json")),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            ColorCOnstant.myBlueColor)),
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
