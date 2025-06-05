import 'package:drive_mate/ui/view/select/select_view.dart';
import 'package:flutter/material.dart';

import '../../widget/size_widget.dart';
import '../select/smartkey_widget.dart';
import 'control_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  final List<List<dynamic>> controls = [
    [Icons.directions_car_filled_outlined, 'Vehicle Control'],
    [Icons.two_wheeler_outlined, 'Bicycle Control'],
    [Icons.my_location, 'Location'],
    [Icons.key_outlined, 'Valet Mode'],
  ];

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullHeightBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 450,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey[500]!,
                    Colors.grey[600]!,
                    Colors.grey[700]!,
                    Colors.grey[800]!,
                    Colors.white,
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/cloud2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Select();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'G80',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Select();
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.notifications_outlined, size: 40),
                        SizedBox(width: 10),
                        Icon(Icons.settings_outlined, size: 40),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.wb_sunny_outlined, size: 30),
                        Text(
                          '28.1',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.local_gas_station_outlined, size: 35),
                        Text(
                          '424Km',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.my_location_outlined, size: 30),
                        Text(
                          '경상북도 경주시',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Image(
                      image: AssetImage('assets/images/g80.png'),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Options(iconData: Icons.power_settings_new, optionsNm: '시동'),
                Options(iconData: Icons.lock_outline, optionsNm: '도어'),
                Options(iconData: Icons.window_outlined, optionsNm: '창문'),
                Options(
                  iconData: Icons.warning_amber_outlined,
                  optionsNm: '비상등',
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Text(
                '홍길동님, 안녕하세요?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: widget.controls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Control(
                            iconData: widget.controls[index][0],
                            controlNm: widget.controls[index][1],
                          ),
                          Divider(color: Color.fromARGB(120, 120, 120, 120)),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
