import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control({
    super.key,
    required IconData iconData,
    required String controlNm,
  }) : this._iconData = iconData,
       this._controlNm = controlNm;

  final IconData _iconData;
  final String _controlNm;

  @override
  State<StatefulWidget> createState() => ControlState();
}

class ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Icon(widget._iconData, size: 33, color: Colors.orangeAccent),
        Text(
          widget._controlNm,
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white),
      ],
    );
  }
}
