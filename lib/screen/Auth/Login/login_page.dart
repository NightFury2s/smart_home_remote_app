import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:IntelliHome/constants/app_colors.dart';
import 'package:IntelliHome/global/common/toast.dart';
import 'package:IntelliHome/screen/Auth/Register/register_page.dart';
import 'package:IntelliHome/screen/Auth/firebase_auth_implementation/firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  // CONTROLLER FOR USERNAME AND PASSWORD
  // TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLogging = false;

  @override
  void dispose() {
    // _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 45,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterPage(),
                  ),
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: AppColor.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 120),
                  child: Column(
                    children: [
                      Text(
                        'Đăng nhập ngay',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Vui lòng đăng nhập để sử dụng ứng dụng',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                      ),

                      // INPUT EMAIL
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
                          controller: _emailController,
                          cursorColor: Color(0xffF5591F),
                          decoration: InputDecoration(
                            hintText: "Email",
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
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE)),
                          ],
                        ),
                        child: TextField(
                          controller: _passwordController,
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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

                      // BUTTON REGISTER
                      GestureDetector(
                        onTap: _logIn,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          padding: EdgeInsets.only(left: 20, right: 20),
                          height: 54,
                          decoration: BoxDecoration(
                            color: AppColor.fgColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Color(0xffEEEEEE)),
                            ],
                          ),
                          child: isLogging
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Đăng nhập",
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),

                      // LOGIN IF USER ALREADY HAVE ACCOUNT
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
                                Navigator.pushNamed(context, '/signup');
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logIn() async {
    // CHECK IF USERNAME OR PASSWORD IS EMPTY
    setState(() {
      isLogging = true;
    });

    // String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // CHECK LOGIN SUCCESS OR NOT
    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);

      setState(() {
        isLogging = false;
      });

      if (user != null) {
        showToast(message: "Bạn đã đăng nhập thành công.");

        // LƯU TRẠNG THÁI ĐĂNG NHẬP VÀO SHAREDPREFERENCE
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
        Navigator.pushNamed(context, '/home');
      } else {
        // showToast(message: "Đã có lỗi xảy ra. Vui lòng thử lại.");
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        // Handle FirebaseAuthException codes and error messages
        print("FirebaseAuthException during sign up: ${e.message}");
      } else {
        // Handle other unexpected exceptions
        print("Unexpected error during sign up: $e");
      }
    }
  }
}
