import 'package:flutter/material.dart';

class StatusWidget extends StatefulWidget {
  const StatusWidget({
    super.key,
    required IconData iconData,
    required String carInfo,
    required bool isSelected,
    required VoidCallback onPressed,
  }) : this._iconData = iconData,
       this._carInfo = carInfo,
       this._isSelected = isSelected,
       this._onPressed = onPressed;

  final IconData _iconData;
  final String _carInfo;
  final bool _isSelected;
  final VoidCallback _onPressed;

  @override
  State<StatefulWidget> createState() => StatusWidgetState();
}

class StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    bool isClick = widget._isSelected;

    return GestureDetector(
      onTap:
          widget._onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            children: [
              Icon(
                widget._iconData,
                size: 30,
                color: isClick ? Colors.orangeAccent : Colors.black,
              ),
              SizedBox(width: 20),
              Text(widget._carInfo, style: TextStyle(fontSize: 20)),
              Spacer(),
              Text(
                isClick ? '열림' : '닫힘',
                style: TextStyle(
                  color: isClick ? Colors.orangeAccent : Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
