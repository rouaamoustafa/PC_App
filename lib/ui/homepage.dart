import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:task_notification/services/notification_services.dart';
import 'package:task_notification/services/theme_services.dart';
import 'package:task_notification/ui/add_task_bar.dart';
import 'package:task_notification/ui/testPage.dart';
import 'package:task_notification/ui/theme.dart';
import 'package:task_notification/widgets/button.dart';
//import 'package:task_notification/ui/add_task_bar.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate  = DateTime.now();
  var notifyHelper;
  @override
  void initState(){
    notifyHelper = NotifyHelper();
    notifyHelper.requestIOSPermissions();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),

      body: Column(
        children: [
           _addTaskBar(),
           _addDateBar(),

        ],
      ),
    );
  }
  _addDateBar( ){
   return Container(
     margin: const EdgeInsets.only(top:20 , left:20  ),
     child: DatePicker(
         DateTime.now(),
         height: 100,
         width: 80,
         initialSelectedDate: DateTime.now(),
         selectionColor: primaryClr,
         selectedTextColor: Colors.white,
         dateTextStyle: GoogleFonts.lato(
           textStyle:TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w600,
             color: Colors.grey,
           ),
         ),
         dayTextStyle: GoogleFonts.lato(
           textStyle:TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.w600,
             color: Colors.grey,
           ),
         ),
         monthTextStyle: GoogleFonts.lato(
           textStyle:TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w600,
             color: Colors.grey,
           ),

         ),
         onDateChange:(date){
           _selectedDate = date;
         }
     ),
   );

 }

  _addTaskBar(){
    return        Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin :const EdgeInsets.only(left: 20 , right: 20 ,top :10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,),
                Text('Today', style: HeadingStyle,),
              ],
            ),
          ),

          // MyButton(
          //   label: "+ Add Task",
          //   onTap: ()=>Get.to(testPage())
          //        ),
          GestureDetector(
          onTap: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>testPage())),
          child: Container(
    width: 120,
    height: 60,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: primaryClr
    ),
    child: Container(
    margin: EdgeInsets.all(10),
    child: Text("+ Add Task",

    style: TextStyle(
    fontSize: 20,
    color: Colors.white,
    ),
    ),
    ),
    ),
    )

        ],
      ),
    );
  }

  _appBar() {
      return AppBar(
        elevation: 0,
        //backgroundColor: Colors.white54,
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap:(){
             print('tapped');
             ThemeService().switchTheme();
          },
          child: Icon(
            Get.isDarkMode?Icons.wb_sunny_outlined: Icons.nightlight_round ,
            size: 20,
            color: Get.isDarkMode ? Colors.white :Colors.black
          ),
        ),
        actions: [

          CircleAvatar(
            backgroundImage: AssetImage(
                "images/index.png"
            )
          ),
          SizedBox(width: 20,),
        ],
      ) ;


  }
}
