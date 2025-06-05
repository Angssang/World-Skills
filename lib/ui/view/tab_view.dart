import 'package:drive_mate/ui/view/home/control_view.dart';
import 'package:drive_mate/ui/view/home/home_view.dart';
import 'package:drive_mate/ui/view/home/share_view.dart';
import 'package:drive_mate/ui/view/home/status_view.dart';
import 'package:flutter/material.dart';

class TabView extends StatefulWidget {
  TabView({super.key});

  final bodywidgets = <Widget>[Home(), const Controls(), const Status(), const Share()];


  @override
  State<StatefulWidget> createState() => TabViewState();
}

class TabViewState extends State<TabView> {
  late PageController pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    this.pageController = PageController();
    this._selectedIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
    this.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: updateSelectedIndex,
        children: widget.bodywidgets,
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 1)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: (selectedIndex) {
            this.updateSelectedIndex(
              selectedIndex,
              () => this.pageController.animateToPage(
                this._selectedIndex,
                duration: Duration(milliseconds: 250),
                curve: Curves.easeInOut,
              ),
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 40),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.control_camera_outlined, size: 40),
              label: 'Control',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car_filled_outlined, size: 40),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.share_outlined, size: 40),
              label: 'Share',
            ),
          ],
        ),
      ),
    );
  }

  void updateSelectedIndex(
    final int selectedIndex, [
    final VoidCallback? callback,
  ]) {
    setState(() {
      this._selectedIndex = selectedIndex;
      callback?.call();
    });
  }
}
