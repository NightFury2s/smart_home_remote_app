import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:IntelliHome/constants/app_colors.dart';
import 'package:IntelliHome/global/common/toast.dart';
// import 'package:IntelliHome/screen/Auth/Login/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late User? currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser() async {
    currentUser = FirebaseAuth.instance.currentUser;
    setState(() {});
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Hiển thị thông báo khi đăng xuất thành công
      // showSignOutMessage();
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  
  Future<void> setting() async {
    try {
      // Hiển thị thông báo khi đăng xuất thành công
      // showSignOutMessage();
      Navigator.pushReplacementNamed(context, '/setting');
    } catch (e) {
      print('Error: $e');
    }
  }
  // void showSignOutMessage() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       behavior: SnackBarBehavior.floating,
  //       backgroundColor: AppColor.black.withOpacity(0.5),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         side: BorderSide(color: AppColor.black),
  //       ),
  //       content: Text('Bạn đã đăng xuất!'),
  //       duration: Duration(seconds: 3), // Thời gian hiển thị thông báo
  //     ),
  //   );
  // }

  Widget _buildUserInfoOrLoginButton() {
    if (currentUser != null) {
      return Text(
        currentUser!.displayName ?? 'Guest',
        style: TextStyle(color: AppColor.white),
      );
    } else {
      return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: Text('Đăng nhập'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget userInfoOrLoginButton = _buildUserInfoOrLoginButton();

    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.fg1Color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close, color: AppColor.white),
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/avatar.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        width: 2,
                        color: AppColor.white,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 10),
                  userInfoOrLoginButton,
                ],
              ),
              Divider(
                thickness: 0.5,
                color: AppColor.white,
                height: 40,
              ),
              drawerTile(Icons.people_alt_outlined, " Quản lý Users", () {}),
              drawerTile(Icons.tv_outlined, " Các thiết bị", () {}),
              drawerTile(Icons.bed_rounded, " Phòng", () {}),
              drawerTile(Icons.settings, " Cài đặt", () {
                setting();
              }),
              drawerTile(Icons.help_outline, " Trợ giúp", () {}),
              Spacer(),
              if (currentUser != null)
                drawerTile(Icons.power_settings_new_outlined, " Đăng xuất", () {
                  signOut();
                  showToast(message: "Bạn đã đăng xuất");
                }),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerTile(IconData icon, String title, VoidCallback ontap) {
    return ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(icon, color: AppColor.white),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
