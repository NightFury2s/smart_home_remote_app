import 'package:flutter/material.dart';
import 'package:smart_home_remote_app/constants/app_colors.dart';
import 'package:smart_home_remote_app/dbHelper/mongodb.dart';
import 'package:smart_home_remote_app/screen/splash_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart home remote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bgColor,
        fontFamily: "Poppins"
      ),
      home: SplashHome(title: 'Smart Home App',),
    );
  }
}
