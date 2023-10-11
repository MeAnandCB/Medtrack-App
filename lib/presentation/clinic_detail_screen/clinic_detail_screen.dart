import 'package:college/presentation/clinic_detail_screen/widgets/medicine_widget.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ClinicDetailsPage extends StatefulWidget {
  const ClinicDetailsPage({Key? key}) : super(key: key);

  @override
  _ClinicDetailsPageState createState() => _ClinicDetailsPageState();
}

class _ClinicDetailsPageState extends State<ClinicDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorCOnstant.myRoseColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                      items: [
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            "https://images.pexels.com/photos/52527/dentist-pain-borowac-cure-52527.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            "https://images.pexels.com/photos/8460047/pexels-photo-8460047.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            "https://images.pexels.com/photos/3845685/pexels-photo-3845685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                      options:
                          CarouselOptions(autoPlay: true, viewportFraction: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Paediatric and Family Dental Clinic",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorCOnstant.myRoseColor,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "This is one of the Best Dental Clinics in Ernakulam that offers a lot of treatments such as Paediatric Dentistry, Cosmetic/ Aesthetic Dentistry, Myofunctional appliances, Scaling/Polishing, Full Denture (Acrylic), Oral & Maxillofacial Surgery, Corporate Dental Camps, Children Dentistry (Paediatric Dentistry), Dental Implant Fixing, and Orthodontics – Braces and Ortho Appliance. The clinic also offers Cosmetic Dentistry in Ernakulam and has been reviewed positive by all the patients.",
                          style: TextStyle(
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              labelColor: ColorCOnstant.myRoseColor,
              indicatorColor: ColorCOnstant.myRoseColor,
              controller: _tabController,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  text: 'Service',
                ),
                Tab(text: 'Medicine List'),
              ],
            ),
            Container(
              height: MediaQuery.of(context)
                  .size
                  .height, // Adjust this value as needed
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Service Tab Content
                  Center(
                    child: Text("Service Tab Content Goes Here"),
                  ),

                  // Medicine List Tab Content
                  MedicineList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
