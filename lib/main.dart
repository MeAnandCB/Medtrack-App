import 'package:college/box/box.dart';
import 'package:college/model/history_model.dart';
import 'package:college/model/profile_model.dart';
import 'package:college/presentation/department_screen/controller/department_screen_controller.dart';
import 'package:college/presentation/doctors_list/controller/doctors_list_controller.dart';
import 'package:college/presentation/hospital_list_screen/controller/hospital_list_controller.dart';
import 'package:college/presentation/login_screen/controller/login_controller.dart';
import 'package:college/presentation/register_screen/controller/register_screen_controller.dart';
import 'package:college/presentation/splash_screen/splash_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesClass().init();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryModelAdapter());
  historyBox = await Hive.openBox<HistoryModel>('localdb');
  profileBox = await Hive.openBox<ProfileModel>('profile');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RegistrationScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HospitalListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorsListController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
