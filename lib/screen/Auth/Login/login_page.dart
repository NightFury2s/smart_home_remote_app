import 'package:flutter/material.dart';
import 'package:smart_home_remote_app/constants/app_colors.dart';
import 'package:smart_home_remote_app/screen/Auth/Register/register_page.dart';
import 'package:smart_home_remote_app/screen/home.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              child: Column(
                children: [
                  const Text(
                    'Đăng nhập ngay',
                    style: TextStyle(
                      fontSize: 25, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Vui lòng đăng nhập để sử dụng ứng dụng',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),

                  // INPUT NAME
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: TextField(
                      cursorColor: Color(0xffF5591F),
                      decoration: InputDecoration(
                        hintText: "Tên đăng nhập",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),

                  //INPUT PASSWORD
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Color(0xffEEEEEE)),
                      ],
                    ),
                    child: const TextField(
                      cursorColor: Color(0xffF5591F),
                      decoration: InputDecoration(
                        hintText: "Mật khẩu",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),

                  // FORGET PASSWORD
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Write Click Listener Code Here
                      },
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: AppColor.fgColor),
                      ),
                    ),
                  ),

                  // BUTTON LOGIN
                  GestureDetector(
                    onTap: () {
                      // Write Click Listener Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 54,
                      decoration: BoxDecoration(
                        color: AppColor.fgColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  // REGISTER IF USER DON'T HAVE ACCOUNT
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bạn chưa có tài khoản?  ",
                          style: TextStyle(color: AppColor.grey),
                        ),
                        GestureDetector(
                          child: Text(
                            "Đăng ký ngay",
                            style: TextStyle(
                              color: AppColor.fgColor,
                            ),
                          ),
                          onTap: () {
                            // Write Tap Code Here.
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              )
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 40),
                    child: Text(
                      "Hoặc đăng nhập",
                      style: TextStyle(color: AppColor.grey),
                    ),
                  ),
                ],
              ),
            ),

            // LOGIN WITH SOCIAL
            Container(
              margin: EdgeInsets.only(bottom: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('Facebook');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/889/889102.png?w=740&t=st=1669283662~exp=1669284262~hmac=43343dd3e314effcc6da8b8d469baf0973dfe9d139c2d30f849795717cd40163',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Instagram');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-icon/instagram_318-566741.jpg?size=338&ext=jpg&uid=R40945684&ga=GA1.2.1864726488.1662655660&semt=sph',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Twitter');
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://img.freepik.com/free-icon/twitter_318-764740.jpg?size=338&ext=jpg&uid=R40945684&ga=GA1.2.1864726488.1662655660&semt=sph',
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}