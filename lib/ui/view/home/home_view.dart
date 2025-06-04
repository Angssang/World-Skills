import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 530,
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
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'G80',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.notifications_outlined, size: 40),
                      SizedBox(width: 10),
                      Icon(Icons.settings_outlined, size: 40),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.wb_sunny_outlined, size: 30),
                      Text(
                          '28.1',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Icon(
                          Icons.local_gas_station_outlined,
                        size: 35,
                      ),
                      Text(
                          '424Km',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      )
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
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                  Image(
                    image: AssetImage(
                      'assets/images/g80.png'
                  ),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
