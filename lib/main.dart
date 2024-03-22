import 'package:college/box/box.dart';
import 'package:college/model/history_model.dart';
import 'package:college/model/profile_model.dart';
import 'package:college/presentation/splash_screen/splash_screen.dart';
import 'package:college/shared_preferances/shared_preferances.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
