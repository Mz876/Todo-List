import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget{

  final String text;
  VoidCallback onPressed;

    MyButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return   MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      textColor: Colors.black,
      
      child: Text(text),
    );
  }
}