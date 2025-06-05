import 'package:drive_mate/ui/view/home/status_widget.dart';
import 'package:flutter/material.dart';

import '../select/select_view.dart';

class Status extends StatefulWidget {
  const Status({super.key});

  final List<List<dynamic>> _stats = const [
    [Icons.car_rental_outlined, '도어'],
    [Icons.window_outlined, '창문'],
    [Icons.directions_car_filled_outlined, '테일게이트'],
    [Icons.hail_outlined, '후드'],
  ];

  final List<List<dynamic>> _filters   = const[
    [Icons.ac_unit_outlined, '냉/난방'],
    [Icons.front_hand_outlined, '핸들 열선'],
    [Icons.directions_car_filled_outlined, '앞유리 성에 제거'],
    [Icons.hourglass_empty_outlined, '뒷유리 열선'],
    [Icons.view_sidebar_outlined, '뒷유리 사이드 미러  열선'],
  ];

  @override
  State<StatefulWidget> createState() => StatusState();
}

class StatusState extends State<Status> with SingleTickerProviderStateMixin {
  late List<bool> _selected;
  late List<bool> _select;
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected = List<bool>.filled(widget._stats.length,false);
    _select = List<bool>.filled(widget._filters.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
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
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
                  ),
                  SizedBox(width: 45),
                  Text(
                    'Status',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  Icon(Icons.notifications_outlined, size: 35),
                  SizedBox(width: 10),
                  Icon(Icons.settings_outlined, size: 35),
                ],
              ),
            ),
            TabBar(
              tabs: [Tab(child: Text('차량')), Tab(child: Text('공조'))],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          '차량 상태',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget._stats.length,
                          itemBuilder: (context, i) {
                            return StatusWidget(
                              isSelected: _selected[i],
                              iconData: widget._stats[i][0],
                              carInfo: widget._stats[i][1],
                              onPressed: () {
                                setState(() {
                                  _selected[i] = !_selected[i];
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          '공존 상태',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: widget._filters.length,
                          itemBuilder: (context, i) {
                            return StatusWidget(
                              isSelected: _select[i],
                              iconData: widget._filters[i][0],
                              carInfo: widget._filters[i][1],
                              onPressed: () {
                                setState(() {
                                  _select[i] = !_select[i];
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // )
          ],
        ),
      ),
    );
  }
}
