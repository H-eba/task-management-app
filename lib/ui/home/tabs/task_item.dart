import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled1/firebase/firebase_function.dart';
import 'package:untitled1/firebase/task_modle.dart';

import '../../edit_screen/edit_screen.dart';



class TaskItem extends StatelessWidget {
  TaskModle taskModle;
  TaskItem({required this.taskModle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Slidable(startActionPane: ActionPane(motion: DrawerMotion(),
          extentRatio: .5,
          children: [
            SlidableAction(onPressed: (context){
              FirebaseFunction.deleteTask(taskModle.id??'');
            },
              backgroundColor: Colors.red,
              icon: Icons.delete,
              spacing: 12,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),),

            SlidableAction(onPressed: (context){

              Navigator.pushNamed(context, EditScreen.routeName,
              arguments: taskModle);
            },
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              spacing: 12,
              label: 'Edit',
            ),

          ],),
          child: Row(
            children: [
              taskModle.isDone?
          Container(
          height: 90,
            width: 7,
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(25)),
          )
             : Container(
                height: 90,
                width: 7,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(25)),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      maxLines: 1,
                    taskModle.title??'',
                      style: TextStyle(
                        fontSize: 25,

                        color: Colors.black
                      ),
                    ),
                    Text(taskModle.description??'')

                  ],
                ),
              ),
             taskModle.isDone
              ?Container(
                 margin: EdgeInsets.all(7),
                 padding:EdgeInsets.symmetric(vertical: 4,horizontal: 10),

                 child: Text('Done!',style: TextStyle(
                   color: Colors.green,fontWeight: FontWeight.w500,fontSize: 23
                 ),)):
              InkWell(
                onTap: (){
                 if (taskModle.isDone)
                   return;
                 taskModle.isDone=true;
                 FirebaseFunction.updateTask(taskModle);

                },
                child: Container(
                    margin: EdgeInsets.all(7),
                    padding:EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
