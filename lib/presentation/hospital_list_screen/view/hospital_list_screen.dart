import 'package:college/presentation/doctors_screem/doctors_screen.dart';
import 'package:college/presentation/hospital_list_screen/view/widgets/hospital_list_card.dart';
import 'package:flutter/material.dart';

class HospitalListScreen extends StatelessWidget {
  const HospitalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital List"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoctorsPage(),
                    ));
              },
              child: HospialListCard()),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 10),
    );
  }
}
