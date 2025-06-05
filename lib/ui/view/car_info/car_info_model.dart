import 'package:flutter/material.dart';

class CarInfo {

  late Image _carPic;
  late String _carNm;


  CarInfo(
      this._carPic,
      this._carNm);

  Image get carPic => _carPic;
  String get carNm => _carNm;

}
