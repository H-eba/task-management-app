import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate=DateTime.now();
  var formKey=GlobalKey<FormState>();
  String title='';
  String description='';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Text('Add New Task',style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.w700),),
            SizedBox(height: 15,),
            TextFormField(
                onChanged: (text){
                  title=text;
                },
                validator: (text){
                  if(text==null||text.isEmpty){
                    return 'please enter task title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('Title'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                    borderRadius: BorderRadius.circular(15),

                  ),

                )),
            SizedBox(height: 25,),
            TextFormField(
                onChanged: (text){
                  description =text;
                },
                validator: (text){
                  if(text==null||text.isEmpty){
                    return 'please enter task description';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text('task description'),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.blue),
                    borderRadius: BorderRadius.circular(15),

                  ),

                )),
            SizedBox(height: 15,),
            Container(alignment: Alignment.centerLeft,
              child: Text('Select Time',style: TextStyle(fontSize: 25,
                  fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                showCalendar();
              },
              child: Text('${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w100),),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                
                  onPressed: (){
                    addTask();
                  },style:ElevatedButton.styleFrom(backgroundColor: Color(0xFF5D9CEC),
                  shape: StadiumBorder(
                  )
              ),
                  child:Text('Add Task',style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.w300),) ),
            )
          ],
        ),
      ),
    );
  }

  void showCalendar()async{
    var chosendDate=await  showDatePicker
      (context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosendDate!=null){
      selectedDate=chosendDate;
      setState(() {

      });
    }
  }
  void addTask(){
    if (formKey.currentState?.validate()==true){

    }
  }
}
