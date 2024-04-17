import 'package:college/presentation/notification_screen/controller/notification_controller.dart';
import 'package:college/utils/color_constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<AlertController>(context, listen: false).geAlertList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<AlertController>(context);
    print(notificationProvider.alertList?.length);
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification"),
        ),
        body: notificationProvider.isAlertListLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: notificationProvider.alertList?.length == 0
                    ? Center(
                        child: Text("No alert available"),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              width: double.infinity,
                              child: Text(notificationProvider
                                      .alertList?[index].message ??
                                  ""),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: ColorCOnstant.myBlueColor,
                                      width: 2)),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: notificationProvider.alertList?.length ?? 0),
              ));
  }
}
