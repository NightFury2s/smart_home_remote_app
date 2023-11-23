import 'package:flutter/material.dart';
import 'package:smart_home_remote_app/constants/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
          )
        ),

        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.fg1Color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50)
            )
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
                        icon: Icon(Icons.close, color: AppColor.white)
                      );
                    }
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
                        fit: BoxFit.cover
                      ),
                      border: Border.all(
                        width: 2,
                        color: AppColor.white
                      ),
                      shape: BoxShape.circle
                    ),
                  ),

                  SizedBox(
                    width: 10
                  ),

                  // USERNAME
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Xin chào, user!",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      
                      //  EDIT PROFILE BUTTON
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColor.white,
                          side: BorderSide(
                            color: AppColor.white
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        child: Text(
                          "Edit profile",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 12
                          ),
                        )
                      )
                    ],
                  ),
                ],
              ),

              Divider(
                thickness: 0.5,
                color: AppColor.white,
                height: 40,
              ),

              drawerTile(Icons.people_alt_outlined, "Quản lý Users", () {}),
              drawerTile(Icons.tv_outlined, "Các thiết bị", () {}),
              drawerTile(Icons.bed_rounded, "Phòng", () {}),
              drawerTile(Icons.settings, "Cài đặt", () {}),
              drawerTile(Icons.help_outline, "Trợ giúp", () {}),
              Spacer(),
              drawerTile(Icons.power_settings_new_outlined, "Đăng xuất", () {}),
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
      leading: Icon(
        icon,
        color: AppColor.white
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
