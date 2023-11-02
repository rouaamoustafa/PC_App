import 'package:flutter/material.dart';
import 'package:task_notification/ui/theme.dart';



class MyButton extends StatelessWidget {

  final String label;
  final Function onTap;
  const MyButton ({super.key , required this.label , required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryClr
        ),
         child: Container(
           margin: EdgeInsets.all(10),
           child: Text(
             label,
             style: TextStyle(
               fontSize: 19,
               color: Colors.white,
             ),
           ),
         ),
      ),
    );
  }
}
