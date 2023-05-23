import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  final String text;
  VoidCallback onPressed;
  MyButton({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        child: Text(text),
    );
  }
}