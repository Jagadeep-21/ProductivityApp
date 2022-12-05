

import 'package:flutter/material.dart';

class cont extends StatelessWidget {
  late Color colour;
  late double border_radius;
  final text;
  late double height;
  late double width;
  late double padding_whole;
  late double margin_value;


  cont({Key? key, required this.colour,  required this.border_radius, this.text, required this.height, required this.width, required this.padding_whole, required this.margin_value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width:  width,
      padding: EdgeInsets.all(padding_whole),
      margin: EdgeInsets.all(margin_value),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(border_radius),color: colour),
      child: Text(text,style: TextStyle(color: Colors.white),),

    );
  }
}


