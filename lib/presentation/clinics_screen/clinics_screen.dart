import 'dart:ui';

import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../clinic_detail_screen/clinic_detail_screen.dart';

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({super.key});

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  bool isLoading = true; // Variable to track loading state

  @override
  void initState() {
    super.initState();

    // Simulate loading for 2 seconds (you can replace this with your actual loading logic)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // Your blurred background image
      Container(
        width: 1700,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "assets/images/doctors_department/map.jpg",
          fit: BoxFit.cover,
        ),
      ),
      // Add the BackdropFilter to blur the background
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(
              0.3), // Adjust the opacity for the desired blur effect
        ),
      ),
      // Loading indicator or main content with fade transition
      AnimatedSwitcher(
        duration: Duration(milliseconds: 1000), // Adjust the duration as needed
        child: isLoading
            ? Center(
                key: ValueKey<bool>(
                    isLoading), // Use a key to switch between loading and content
                // Display loading indicator
                child: Lottie.asset(
                  "assets/animations/mapLoading.json",
                ))
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Container(
                      width: 1700,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        "assets/images/doctors_department/map.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 400,
                      left: 1500,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 500,
                      left: 500,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 200,
                      left: 900,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 100,
                      left: 100,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      bottom: 100,
                      left: 370,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 200,
                      left: 370,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 400,
                      left: 170,
                      child: Container(
                          height: 70,
                          width: 100,
                          child: Lottie.asset(
                              reverse: true,
                              'assets/animations/location2.json')),
                    ),
                    Positioned(
                      top: 200,
                      left: 270,
                      child: Container(
                          height: 70,
                          width: 100,
                          child:
                              Lottie.asset('assets/animations/location2.json')),
                    ),
                    Positioned(
                      bottom: 120,
                      left: 70,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClinicDetailsPage(),
                          ),
                        ),
                        child: Container(
                            height: 70,
                            width: 100,
                            child: Lottie.asset(
                                reverse: true,
                                'assets/animations/location2.json')),
                      ),
                    )
                  ],
                ),
              ),
      )
    ]));
  }
}
