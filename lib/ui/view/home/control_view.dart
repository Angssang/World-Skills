import 'package:drive_mate/ui/widget/size_widget.dart';
import 'package:flutter/material.dart';

class Controls extends StatelessWidget{
  const Controls({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullSizeBox(
        child: ColoredBox(color: Colors.red),
      )
    );
  }

  
}