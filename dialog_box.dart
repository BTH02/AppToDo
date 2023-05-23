import 'package:app/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  hintText: "Them ghi chu moi"),
                controller: controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 8),
                MyButton(text: "Luu", onPressed:onSave),
                MyButton(text: "Thoat", onPressed:onCancel,)
              ],
            )
          ],
        ),
      ),
    );
  }
}