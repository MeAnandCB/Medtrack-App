import 'package:college/presentation/department_screen/view/department_screen.dart';
import 'package:college/presentation/hospital_list_screen/controller/hospital_list_controller.dart';
import 'package:college/presentation/hospital_list_screen/view/widgets/hospital_list_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HospitalListScreen extends StatefulWidget {
  const HospitalListScreen({super.key});

  @override
  State<HospitalListScreen> createState() => _HospitalListScreenState();
}

class _HospitalListScreenState extends State<HospitalListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HospitalListController>(context, listen: false)
          .getHospitalList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hospitalListProvider = Provider.of<HospitalListController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital List"),
      ),
      body: hospitalListProvider.isHospitalLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : hospitalListProvider.hospitalList.isEmpty
              ? Center(
                  child: Text("No Data Available"),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorsPage(
                                id: hospitalListProvider.hospitalList[index].id
                                    .toString(),
                              ),
                            ));
                      },
                      child: HospialListCard(
                          hosName:
                              hospitalListProvider.hospitalList[index].name ??
                                  "",
                          hosImage:
                              hospitalListProvider.hospitalList[index].image ??
                                  "",
                          hosNum: hospitalListProvider
                                  .hospitalList[index].contactInformation ??
                              "",
                          hosRating:
                              hospitalListProvider.hospitalList[index].rating ??
                                  "",
                          hosaddress: hospitalListProvider
                                  .hospitalList[index].address ??
                              "")),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: hospitalListProvider.hospitalList.length),
    );
  }
}
