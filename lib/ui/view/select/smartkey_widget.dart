import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options extends StatefulWidget{
const Options({
  super.key,
  required IconData iconData,
  required String optionsNm,
}) : this._iconData= iconData,
     this._optionsNm = optionsNm;

final IconData _iconData;
final String _optionsNm;

  @override
  State<StatefulWidget> createState() => OptionsState();
}

class OptionsState extends State<Options>{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              widget._iconData,
              color: Colors.black54,
            ),
          iconSize: 60,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5),
          ),
        ),
        Text(
          widget._optionsNm,
          style:  TextStyle(
            color: Colors.black54,
            fontSize:15
          ),
        )
      ],
    );
  }
  
}