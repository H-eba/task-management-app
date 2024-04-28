import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1/firebase/task_modle.dart';

import '../../firebase/firebase_function.dart';

class EditScreen extends StatefulWidget {
  static String routeName = 'edit screen';

  EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModle;
    return Scaffold(
      backgroundColor: Color(0xFFDFECDB),
      appBar: AppBar(
        title: Text(
          'to do list',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              initialValue: task.title,
              onChanged: (value) {
                task.title=value;
              },
              decoration: InputDecoration(
                  hintText: 'title',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              onChanged: (value) {
                 task.description=value;
              },
              initialValue: task.description,
              decoration: InputDecoration(
                  hintText: 'description',
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(onTap: () async{
              task.data=await showCalendar(context,task.data??0);
              setState(() {

              });
            }, child: Text('selected date')),
            SizedBox(
              height: 25,
            ),
            Text(DateFormat.yMd().format(DateUtils.dateOnly(
                DateTime.fromMicrosecondsSinceEpoch(task.data!)))),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFunction.updateTask(task);
                  Navigator.pop(context);
                },
                child: Text('Edit'))
          ],
        ),
      ),
    );
  }

 showCalendar(BuildContext context,int time) async {
    var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.fromMicrosecondsSinceEpoch(time),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))

   ,
    );
        time=DateUtils.dateOnly(selectedDate!).millisecondsSinceEpoch;
        return time;

  }
}
