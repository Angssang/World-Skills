import 'package:flutter/material.dart';

class InputInfo extends StatelessWidget {
  const InputInfo({
    super.key,
    required IconData iconData,
    required String textField,
    required bool hide,
    required Color color,
  }) : this._iconData = iconData,
       this._textField = textField,
       this._hide = hide,
       this._color = color;

  final IconData _iconData;
  final String _textField;
  final bool _hide;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            spacing: 15,
            children: [
              Icon(_iconData, size: 30, color: _color),
              Expanded(
                child: TextField(
                  obscureText: _hide,
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  decoration: InputDecoration.collapsed(
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                    hintText: _textField,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
