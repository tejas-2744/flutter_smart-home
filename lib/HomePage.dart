import 'package:flutter/material.dart';
import 'package:smart_home_demo/util/smart_device.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // List of smart devices
  List mySmartDevices = [
    // { smartDeviceName, iconPath, powerStatus }
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", true],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  //Power Button Switched
  void powerSwitchChanged(bool value,int index)
  {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 40,
                    color: Colors.grey[800],
                  ),
                  //account icon
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),

            SizedBox(height: 20),

            //Welcome home tejas
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,",style: GoogleFonts.poppins(fontSize: 20,color: Colors.grey[700])),
                  Text("TEJAS MERJA", style: GoogleFonts.bebasNeue(fontSize: 72),),
                ],

              ),
            ),

            SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),

            SizedBox(height: 10),

            //Smart devices
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Smart Devices",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.grey[800]),),
            ),
            Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                padding: EdgeInsets.all(25),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1/1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value,index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
