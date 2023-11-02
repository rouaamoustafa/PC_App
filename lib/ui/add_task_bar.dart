import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(

      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap:(){
          print('tapped');

        },
        child: Icon(
           Icons.arrow_back_ios,
            size: 20,
            color: Get.isDarkMode ? Colors.white :Colors.black
        ),
      ),
      actions: [

        // CircleAvatar(
        //     backgroundImage: AssetImage(
        //         "images/index.png"
        //     )
        // ),
        // SizedBox(width: 20,),
      ],
    ) ;


  }
}
