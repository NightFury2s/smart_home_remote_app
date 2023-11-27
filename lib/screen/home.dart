import 'package:flutter/material.dart';
import 'package:smart_home_remote_app/constants/app_colors.dart';
import 'package:smart_home_remote_app/model/smart_home_model.dart';
import 'package:smart_home_remote_app/screen/room_card.dart';
import 'package:smart_home_remote_app/screen/widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(isLoggedIn: isLoggedIn),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // MENU
                    Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          }, 
                          icon: Icon(
                            Icons.menu
                          )
                        );
                      }
                    ),

                    // DISPLAY TEMPERATURE AND ADD BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.device_thermostat_outlined,
                              size: 40,
                            ),
                            Text(
                              "27\u00b0",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                        
                        Container(
                          width: 90,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 5,
                                color: AppColor.black.withOpacity(.1)
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                            )
                          ),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.fgColor,
                              shape: BoxShape.circle
                            ),
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: AppColor.white,
                            )
                          ),
                        ),
                      ],
                    ),

                    // DISPLAY WELCOME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Xin chào user!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600
                          ),
                        ),
            
                        Text(
                          "Chào mừng quay trở lại",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColor.fgColor.withOpacity(.5),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),

                    // DISPLAY WEATHER
                    Container(
                      width: double.infinity,
                      height: 70,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 5,
                            color: AppColor.black.withOpacity(.1)
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        )
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.fgColor.withOpacity(.1),
                              shape: BoxShape.circle
                            ),
                            child: Icon(
                              Icons.wb_cloudy_sharp,
                              size: 30,
                              color: AppColor.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // DISPLAY ALL ROOM
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Rooms",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.arrow_forward_ios)
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

            // ROOM CARD
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: smartHomeData.length + 2,
                itemBuilder: (context, index) {

                  if (
                    index == 0 || smartHomeData.length + 1 == index
                  ) {
                    return Container(
                      width: 15,
                      height: size.height * 0.5,
                      color: Colors.transparent,
                    );
                  }

                  final data = smartHomeData [index - 1];

                  return RoomCard(
                    roomData: data
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
