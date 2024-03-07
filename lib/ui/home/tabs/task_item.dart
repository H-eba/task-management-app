import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

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
            SlidableAction(onPressed: (context){},
              backgroundColor: Colors.red,
              icon: Icons.delete,
              spacing: 12,
              label: 'Delete',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),),

            SlidableAction(onPressed: (context){},
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              spacing: 12,
              label: 'Edit',
            ),

          ],),
          child: Row(
            children: [
              Container(
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
                      'Task Title',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text('Task Description')
                  ],
                ),
              ),

              Container(
                  margin: EdgeInsets.all(7),
                  padding:EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
