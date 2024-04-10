import 'package:college/app_config/app_config.dart';
import 'package:college/box/box.dart';
import 'package:college/global_widgets/confirmation_popup.dart';
import 'package:college/model/history_model.dart';
import 'package:college/presentation/booking_history_screen/controller/history_screen_controller.dart';
import 'package:college/presentation/department_screen/controller/department_screen_controller.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<BookingHistoryController>(context, listen: false)
          .getHistoryList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingHistoryController>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Booking History",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          provider.isDepartmentLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : provider.historyRes?.length == 0
                  ? Container(
                      height: MediaQuery.sizeOf(context).height,
                      child: Center(
                        child: Text("Currently, no bookings are available."),
                      ),
                    )
                  : ListView.separated(
                      reverse: true,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: provider.historyRes?.length ?? 0,
                      itemBuilder: (context, index) {
                        //  HistoryModel history = historyBox.getAt(index);
                        return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black)),
                              child: ExpansionTile(
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Text(
                                            provider.historyRes?[index].doctor
                                                    ?.name ??
                                                "",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: InkWell(
                                            onTap: () {
                                              logoutConfirmPopup(
                                                  iconimage: Icons
                                                      .delete_forever_outlined,
                                                  context: context,
                                                  yes: () async {
                                                    Navigator.pop(context);
                                                    await Provider.of<
                                                                BookingHistoryController>(
                                                            context,
                                                            listen: false)
                                                        .cancelAppointment(
                                                            id: provider
                                                                    .historyRes?[
                                                                        index]
                                                                    .id
                                                                    .toString() ??
                                                                "");
                                                    await Provider.of<
                                                                BookingHistoryController>(
                                                            context,
                                                            listen: false)
                                                        .getHistoryList();
                                                  },
                                                  message:
                                                      "Do you want to cancel the booking ?");
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: ColorCOnstant
                                                      .myBlueColor),
                                              child: Center(
                                                child: Text(
                                                  "Cancel Booking",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            provider.historyRes?[index].doctor
                                                    ?.specialization
                                                    .toString() ??
                                                "",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ),
                                        Text(
                                          provider.historyRes?[index].time ??
                                              "",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              AppConfig
                                                                      .mediaUrl +
                                                                  (provider
                                                                          .historyRes?[
                                                                              index]
                                                                          .doctor
                                                                          ?.image ??
                                                                      ""),
                                                            ),
                                                            fit: BoxFit
                                                                .contain)),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    provider
                                                            .historyRes?[index]
                                                            .doctor
                                                            ?.description ??
                                                        "",
                                                    maxLines: 4,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    provider
                                                            .historyRes?[index]
                                                            .doctor
                                                            ?.specialization ??
                                                        "",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.red),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Booking Date :  ${_formatDate(provider.historyRes?[index].day.toString() ?? "")}",
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      Text(
                                                        "Booking Time : ${provider.historyRes?[index].time ?? ""}",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                            //
                            );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          )),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the date string
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    // Dateformat('dd-MM-yyyy').format(dateTime); // Format the date
    return formattedDate;
  }
}
