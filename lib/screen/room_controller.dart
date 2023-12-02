import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:IntelliHome/constants/app_colors.dart';
import 'package:IntelliHome/model/smart_home_model.dart';
import 'package:IntelliHome/screen/widgets/devices_switch.dart';
import 'package:IntelliHome/screen/widgets/glass_morphism.dart';

class RoomController extends StatefulWidget {
  const RoomController({super.key, required this.roomData});

  final SmartHomeModel roomData;

  @override
  State<RoomController> createState() => _RoomControllerState();
}

class _RoomControllerState extends State<RoomController> {
  @override
  Widget build(BuildContext context) {

    final SmartHomeModel roomData = this.widget.roomData;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(

       // NAVIGATION BAR
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(roomData.roomImage),
            fit: BoxFit.cover
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.fgColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.white,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.fgColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(
                        Icons.settings,
                        color: AppColor.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomCard(size, roomData),
          ],
        ),
      ),
    );
  }

  // BOTTOMCARD CONTROLLER
  Widget bottomCard(Size size, SmartHomeModel roomData) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        // color: AppColor.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ROOM NAME
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomData.roomName,
                    style: TextStyle(
                      color:AppColor.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: roomData.roomStatus,
                        activeColor: AppColor.white,
                        trackColor: AppColor.black.withOpacity(0.3),
                        thumbColor: AppColor.fgColor,
                        onChanged: (value) {
                          setState(() {
                            roomData.roomStatus = value;
                          });
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // STATUS
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 60
              ),
              child: Text.rich(
                TextSpan(
                  text: '${roomData.roomName} của bạn đã được kết nối với ${roomData.devices!.length} thiết bị và '
                  '${roomData.userAccess} người dùng khác có quyền truy cập vào phòng này.',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16
                  ),
                )
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 20
              ),
              child: Text(
                roomData.roomTemperature,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white
                ),
              ),
            ),
            Divider(
              color: AppColor.white.withOpacity(0.5),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Devices',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: AppColor.white,
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                itemCount: roomData.devices!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0 ||  roomData.devices!.length + 1 == index) {
                    return SizedBox(
                      width: 10,
                    );
                  }
                  final data = roomData.devices![index - 1];
                  return DeviceSwitch(data: data);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}