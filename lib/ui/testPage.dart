import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_notification/ui/homepage.dart';
import 'package:task_notification/ui/theme.dart';
import 'package:task_notification/widgets/button.dart';
import 'package:task_notification/widgets/input_field.dart';

class testPage extends StatefulWidget {
  const testPage({Key? key}) : super(key: key);

  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime selectedate = DateTime.now();
  String endTime = "9:30 PM";
  String startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [5 ,10 ,15 ,20];

  String _selectedRepeat = "None";
  List<String> repeatList = ["None" ,"Daily" ,"Weekly" ,"Monthly"];

  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: context.theme.backgroundColor,
      appBar: _appBar( context),
      body:Container(
        padding: EdgeInsets.only(left: 20 , right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Add Tasks',
              style: HeadingStyle,),
              MyInputField(title: "Title", hint: "Enter your title here",controller: _titleController,),
              MyInputField(title: "Note", hint: "Enter your note here",controller: _noteController,),
              MyInputField(title: "Date", hint: DateFormat.yMd().format(selectedate),
              widget: IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey
                ),
                onPressed: (){
                          _getDateFromUser();
                          print('sjfdhsd.fjc');
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Start Date ",
                        hint: startTime,
                        widget: IconButton(
                          icon:Icon(
                              Icons.access_time_rounded,
                          color: Colors.grey,
                          ),
                          onPressed: (){
                            _getTimeFromUser(isStartTime: true);
                          },
                        ),
                      ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: MyInputField(
                      title: "End Date ",
                      hint: endTime,
                      widget: IconButton(
                        icon:Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: (){
                          _getTimeFromUser(isStartTime: false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(title: "Remind", hint: "$_selectedRemind minutes early",
                  widget:DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        ),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitleStyle,
                    underline: Container(
                       height: 0,
                    ),
                    items: remindList.map<DropdownMenuItem<String>>((int value)
                    { return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString())
                      );
                    }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        _selectedRemind = int.parse(newvalue!);
                      });
                    },
                  ),
              ),
              MyInputField(title: "Repeat", hint: "$_selectedRepeat",
                widget:DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  style: subtitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  items: repeatList.map<DropdownMenuItem<String>>((String value)
                  { return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value! , style:TextStyle(color: Colors.grey))
                  );
                  }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      _selectedRepeat  = newvalue!;
                    });
                  },
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _colorPallete(),
                  //MyButton(label: "Create Task", onTap: ()=> _validateData()),
                  GestureDetector(
            onTap: ()=> _validateData(),
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
                  "Create Task",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
                ],
              )
            ],
          ),
        ),
      )
    );
  }

  _validateData(){
       if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty ){
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
       }else if(_titleController.text.isEmpty ||_noteController.text.isEmpty){
         Get.snackbar("Required", "All fields are required !",
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.white,
         colorText: pinkClr,
         icon:Icon(Icons.warning_amber_rounded ,color:Colors.red),
         );

       }
  }

  _colorPallete(){
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",style: titleStyle,),
        SizedBox(height: 8),
        Wrap(
          children:
          List<Widget>.generate(
              3,
                  (int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedColor = index;
                    });

                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1.0),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor:index == 0?primaryClr:index == 1?pinkClr:yellowClr,
                      child: selectedColor == index?Icon(Icons.done , color: Colors.white,size: 16):Container(),
                    ),
                  ),
                );

              }),

        ),
      ],
    );
  }

  _appBar(BuildContext context){
      return AppBar(
          elevation: 0,
        backgroundColor: context.theme.backgroundColor,
          leading: GestureDetector(
            onTap:(){
              print('tapped2');
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
            },
            child: Icon(
                Icons.arrow_back_ios,
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
      );
  }

  _getDateFromUser() async{
  DateTime? _pickerDate= await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2123)
    );
  if (_pickerDate != null){
    setState(() {
      selectedate = _pickerDate;
      print(selectedate);
    });

    }else{
    print("it's null or something is wrong");
    }
    
  }

  _getTimeFromUser({required bool isStartTime }){
   var pickedTime = _showTimepicker();
   String _formatedTime = pickedTime.format(context);
   if(pickedTime == null){
     print("Time Canceld");
   }else if (isStartTime == true){
     setState(() {
       startTime = _formatedTime;
     });

   }else if(isStartTime == false){
     setState(() {
       endTime = _formatedTime;
     });

   }


  }

  _showTimepicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input ,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(startTime.split(":")[0]),
            minute: int.parse(startTime.split(":")[1].split("")[0]),
        )
    );
  }

}
