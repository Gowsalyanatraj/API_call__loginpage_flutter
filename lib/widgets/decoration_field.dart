import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

InputDecoration inputFieldDecoration(
    {required String label, required String hintText}) {
  return InputDecoration(
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: HexColor('00B2FF'),
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide(color: HexColor('#00B2FF'), width: 2.0),
      ),
      labelText: label,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.redAccent));
}
