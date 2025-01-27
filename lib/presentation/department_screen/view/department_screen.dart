import 'package:college/app_config/app_config.dart';
import 'package:college/database/database_image.dart';
import 'package:college/presentation/doctors_list/doctors_list.dart';
import 'package:college/presentation/department_screen/controller/department_screen_controller.dart';

import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key, required this.id});
  final String id;

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<DepartmentListController>(context, listen: false)
          .getDepartmentList(id: widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final departmentListProvider =
        Provider.of<DepartmentListController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorCOnstant.myBlueColor,
        centerTitle: true,
        title: Text(
          "Departments",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: departmentListProvider.isDepartmentLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : departmentListProvider.departmentList.isEmpty
              ? Center(
                  child: Text("No Data Available"),
                )
              : GridView.builder(
                  itemCount: departmentListProvider.departmentList.length,
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 180),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorsListScreen(
                            doctorID: departmentListProvider
                                .departmentList[index].id
                                .toString(),
                          ),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorCOnstant.myContainerGrey,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        AppConfig.mediaUrl +
                                            departmentListProvider
                                                .departmentList[index].image!,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                departmentListProvider
                                        .departmentList[index].departmentName ??
                                    "",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
    );
  }
}
