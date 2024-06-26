import 'package:IntelliHome/screen/Devices/devices.dart';
import 'package:IntelliHome/screen/SettingPage/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:IntelliHome/constants/app_colors.dart';
import 'package:IntelliHome/screen/Auth/Login/login_page.dart';
import 'package:IntelliHome/screen/Auth/Register/register_page.dart';
import 'package:IntelliHome/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        '/devices': (context) => Devices(),
      },
      home: const InitializerWidget(),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  @override
  void initState() {
    super.initState();
    navigateUser(); // Call navigateUser() when widget is created
  }

  navigateUser() async {
    // Wait for 3 seconds before navigating to the next page
    await Future.delayed(Duration(seconds: 3));
    // Check if the user is logged in
    if (FirebaseAuth.instance.currentUser != null) {
      // If the user is logged in, navigate to the next page
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      // User is not logged in, navigate to the login page
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Back to home screen after 3 seconds
    return const SplashHome(title: 'Smart Home App');
  }
}