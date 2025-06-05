import 'package:flutter/material.dart';

class ConditionWidget extends StatefulWidget {
  const ConditionWidget({
    super.key,
    required IconData iconData,
    required String carInfo,
    required bool isSelected,
  }) : this._iconData = iconData,
        this._carInfo = carInfo,
        this._isSelected = isSelected;

  final IconData _iconData;
  final String _carInfo;
  final bool _isSelected;

  @override
  State<StatefulWidget> createState() => ConditionWidgetState();
}

class ConditionWidgetState extends State<ConditionWidget> {
  @override
  Widget build(BuildContext context) {
    bool isClick = widget._isSelected;

    return Padding(
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
              isClick ? '열림' : '꺼짐',
              style: TextStyle(
                  color: isClick ? Colors.orangeAccent : Colors.black,
                  fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
