import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/firebase/firebase_function.dart';
import 'package:untitled1/firebase/task_modle.dart';

import 'package:untitled1/ui/home/tabs/task_item.dart';
class TaskTab extends StatefulWidget {
   TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
 DateTime selectedData= DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: selectedData,
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          height: 90,

          onDateChange: (date) {
           selectedData=date;
           setState(() {

           });
          },
        ),

        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModle>>(
            stream: FirebaseFunction.getTasks(selectedData),
            builder: (context,snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              }
              if (snapshot.hasError) {
                return Column(children: [
                  Text('somthing is wrong')
                ],);
              }
              var tasks = snapshot.data!.docs.map((e) => e.data()).toList() ??
                  [];
              if(tasks.isEmpty){
                return Center(child: Text('no tasks',style: TextStyle(fontSize: 20),));
              }
              return ListView.builder(itemBuilder: (context, index) {
                return TaskItem(taskModle: tasks[index],);
              },
                  itemCount: tasks.length);
            }
          ),
        )
      ],
    );
  }
}


