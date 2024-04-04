import 'package:college/database/database_image.dart';
import 'package:college/presentation/clinic_detail_screen/widgets/medicine_widget.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorsDetailsPage3 extends StatefulWidget {
  const DoctorsDetailsPage3({Key? key}) : super(key: key);

  @override
  _DoctorsDetailsPage3State createState() => _DoctorsDetailsPage3State();
}

class _DoctorsDetailsPage3State extends State<DoctorsDetailsPage3>
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

  final String mapAddress =
      'https://maps.app.goo.gl/xmZb7e7ewDP7iehYA'; // Replace with the map address

  // Function to launch the map
  _launchMap() async {
    if (await canLaunch(mapAddress)) {
      await launch(mapAddress);
    } else {
      // Handle error
      print('Could not launch $mapAddress');
    }
  }

  final String phoneNumber =
      'tel:8590775925'; // Replace with the desired phone number

  // Function to launch the phone dialer
  _launchPhoneDialer() async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error (e.g., unable to open the phone dialer)
      print('Could not launch $phoneNumber');
    }
  }

  final String whatsapp =
      'whatsapp://send?phone=+918590775925'; // Replace with the desired phone number

  // Function to open the WhatsApp chat
  _openWhatsAppChat() async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      // Handle error (e.g., WhatsApp not installed)
      print('Could not open WhatsApp chat for $phoneNumber');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorCOnstant.myBlueColor),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              children: [
                Container(
                  height: 400,
                  child: Image.network(
                    "https://5.imimg.com/data5/SY/JZ/UL/SELLER-2434239/clinic-interior-design-and-execution-500x500.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          DatabaseImages.doctorsClinic[3]['name'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: ColorCOnstant.myWhite,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            for (int i = 1;
                                i <= DatabaseImages.doctorsClinic[0]['rating'];
                                i++)
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          DatabaseImages.doctorsClinic[3]['specialty']
                              .toString(),
                          style: TextStyle(
                            color: ColorCOnstant.myWhite,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Palarivattom Edappally Rd, Kochi Metro Pillar No 505/506 at Mamangalam., Kochi, Kerala 682025",
              style: TextStyle(height: 1.5, fontSize: 14),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      _launchMap();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorCOnstant.myBlueColor,
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.directions,
                            color: ColorCOnstant.myWhite,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Directions",
                            style: TextStyle(color: ColorCOnstant.myWhite),
                          ),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _launchPhoneDialer();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorCOnstant.myBlueColor,
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: ColorCOnstant.myWhite,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Phone",
                            style: TextStyle(color: ColorCOnstant.myWhite),
                          ),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _openWhatsAppChat();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorCOnstant.myBlueColor,
                      ),
                      child: Center(
                          child: Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: ColorCOnstant.myWhite,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(color: ColorCOnstant.myWhite),
                          ),
                        ],
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorCOnstant.myBlueColor,
                    ),
                    child: Center(
                        child: Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: ColorCOnstant.myWhite,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Share",
                          style: TextStyle(color: ColorCOnstant.myWhite),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ExpansionTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.timelapse_rounded,
                      color: const Color.fromARGB(255, 38, 95, 39),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Open 10 am to 6 pm",
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: const Color.fromARGB(255, 38, 95, 39),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              children: List.generate(
                  5,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.timelapse_rounded,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Open ${index + 8} am to  ${index + 5} pm",
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ))),
          TabBar(
            labelColor: ColorCOnstant.myBlueColor,
            indicatorColor: ColorCOnstant.myBlueColor,
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
            height: MediaQuery.of(context).size.height *
                .70, // Adjust this value as needed
            child: TabBarView(
              controller: _tabController,
              children: [
                // Service Tab Content
                ListView.builder(
                    itemCount: DatabaseImages.medicalConditions.length,
                    itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 173, 171, 171))),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                DatabaseImages.medicalConditions[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )),

                // Medicine List Tab Content
                MedicineList()
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: imagesList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
              itemBuilder: (context, index) => Container(
                child: Image.asset(
                  imagesList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }

  List<String> imagesList = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
  ];
}
