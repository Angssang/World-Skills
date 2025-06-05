import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  const Options({
    super.key,
    required IconData iconData,
    required String optionsNm,
  }) : this._iconData = iconData,
       this._optionsNm = optionsNm;

  final IconData _iconData;
  final String _optionsNm;

  @override
  State<StatefulWidget> createState() => OptionsState();
}

class OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        IconButton.outlined(
          onPressed: () {},
          icon: Icon(widget._iconData, color: Colors.black),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(17),
          ),
          iconSize: 55,
        ),
        Text(
          widget._optionsNm,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ],
    );
  }
}
