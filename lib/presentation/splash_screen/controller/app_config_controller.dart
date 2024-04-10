import 'package:college/utils/app_utils.dart';
import 'package:flutter/material.dart';

class AppConfigController with ChangeNotifier {
  bool isLoading = false;

  List<int> studentCourseList = [];
  bool haveAccess = false;
  String? newMobileVersion;

  /// This global key is used in material app for navigation through firebase notifications.
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();

  haveAccessKey() async {
    String accessToken = await AppUtils.getAccessKey() ?? "";
    if (accessToken.isEmpty) {
      haveAccess = false;
      notifyListeners();
    } else {
      haveAccess = true;
      notifyListeners();
    }
  }

  void resetState() {
    isLoading = false;

    studentCourseList = [];
  }
}
