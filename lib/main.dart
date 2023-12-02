import 'package:IntelliHome/screen/SettingPage/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:IntelliHome/constants/app_colors.dart';
import 'package:IntelliHome/screen/Auth/Login/login_page.dart';
import 'package:IntelliHome/screen/Auth/Register/register_page.dart';
import 'package:IntelliHome/screen/home.dart';
// import 'package:IntelliHome/dbHelper/mongodb.dart';
import 'package:IntelliHome/screen/splash_home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntelliHome',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColor.bgColor,
        fontFamily: "Poppins"
      ),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => RegisterPage(),
        '/setting': (context) => SettingPage(),
      },
      home: SplashHome(title: 'Smart Home App'),
    );
  }
}
