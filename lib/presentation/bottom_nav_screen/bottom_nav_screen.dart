import 'package:college/presentation/booking_history_screen/view/booking_history.dart';
import 'package:college/presentation/clinics_screen/clinics_screen.dart';
import 'package:college/presentation/hospital_list_screen/view/hospital_list_screen.dart';
import 'package:college/presentation/newsfeed_screen/newsfeed_screen.dart';

import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../department_screen/view/department_screen.dart';
import '../profile_screen/profile_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    HospitalListScreen(),
    // DoctorsPage(),
    // ClinicsScreen(),
    NewsFeed(),
    BookingHistory(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          selectedItemColor: ColorCOnstant.myBlueColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: "Hospital"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.business_outlined), label: "Clinic"),
            BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_sharp), label: "News"),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: "History"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
