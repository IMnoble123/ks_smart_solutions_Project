import 'package:flutter/material.dart';

class ShowsnakBar{
  static showsnak (BuildContext context, String text){

    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}