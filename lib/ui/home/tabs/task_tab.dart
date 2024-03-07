import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/ui/home/tabs/task_item.dart';
class TaskTab extends StatelessWidget {
  const TaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: Colors.blue,
          selectedTextColor: Colors.white,
          height: 90,

          onDateChange: (date) {
            // New date selected
            //setState(() {
            // _selectedValue = date;
            // });
          },
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskItem();
          },
            itemCount: 10,),
        )
      ],
    );
  }
}
