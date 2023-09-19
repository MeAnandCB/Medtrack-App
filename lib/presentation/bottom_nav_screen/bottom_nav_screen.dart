import 'package:college/presentation/clinics_screen/clinics_screen.dart';
import 'package:college/presentation/profile_screen/profile_screen.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../doctors_screem/doctors_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _screens = [
    DoctorsPage(),
    ClinicsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            _selectedIndex = value;
            setState(() {});
          },
          selectedItemColor: ColorCOnstant.myRoseColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: "Doctor's Zone"),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_outlined), label: "Clinic"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    );
  }
}
